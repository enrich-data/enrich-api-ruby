##
# enrich-api-ruby
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rest-client'
require 'json'

require_relative 'resources/enrich'
require_relative 'resources/search'
require_relative 'resources/verify'

module Enrich
  class Client
    attr_writer :rest_host
    attr_writer :rest_base_path

    attr_accessor :enrich
    attr_accessor :search
    attr_accessor :verify

    @@created_status_code = 201
    @@not_found_status_code = 404
    @@created_retry_count_max = 2

    def initialize()
      @auth = {}

      @enrich = Enrich::EnrichResource.new(self)
      @search = Enrich::SearchResource.new(self)
      @verify = Enrich::VerifyResource.new(self)
    end

    public

    def authenticate(user_id, secret_key)
      @auth["user_id"] = user_id
      @auth["secret_key"] = secret_key
    end

    def rest_host
      @rest_host || "https://api.enrichdata.com"
    end

    def rest_base_path
      @rest_base_path || "/v1"
    end

    def timeout
      @timeout || 5
    end

    def _get(resource, query)
      self._do_get(resource, query, 0, 0)
    end

    protected

    def _do_get(resource, query, retry_count, hold_for_seconds)
      # Abort?
      if retry_count > @@created_retry_count_max
        raise RestClient::NotFound
      else
        # Hold.
        sleep hold_for_seconds

        begin
          response = RestClient::Request.execute(
            :url => self._prepare_rest_url(resource),
            :method => :get,
            :timeout => self.timeout,

            :user => @auth["user_id"],
            :password => @auth["secret_key"],

            :headers => {
              :user_agent => "enrich-api-ruby/1.1.1",
              :accept => :json,
              :content_type => :json,
              :params => query
            }
          )

          status = response.code
        rescue RestClient::NotFound
          status = @@not_found_status_code
        end

        # Re-schedule request? (created)
        if status == @@created_status_code || (retry_count > 0 &&
            status == @@not_found_status_code)
          if response && response.headers[:retry_after]
            hold_for_seconds = Integer(response.headers[:retry_after])
          end

          return self._do_get(
            resource, query, retry_count + 1, hold_for_seconds
          )
        end

        # Not found?
        if status == @@not_found_status_code
          raise RestClient::NotFound
        end

        return JSON.parse(response)
      end
    end

    def _prepare_rest_url(resource)
      return self.rest_host + self.rest_base_path + resource
    end
  end
end
