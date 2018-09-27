##
# enrich-api-ruby
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rest-client'
require 'json'

require_relative 'resources/enrich'
require_relative 'resources/verify'

module Enrich
  class Client
    attr_writer :rest_host
    attr_writer :rest_base_path

    attr_accessor :enrich
    attr_accessor :verify

    def initialize()
      @auth = {}

      @enrich = Enrich::EnrichResource.new(self)
      @verify = Enrich::VerifyResource.new(self)
    end

    public

    def authenticate(user_id, secret_key)
      @auth["user_id"] = user_id
      @auth["secret_key"] = secret_key
    end

    def rest_host
      @rest_host || "https://api.enrich.email"
    end

    def rest_base_path
      @rest_base_path || "/v1"
    end

    def timeout
      @timeout || 40
    end

    def _get(resource, query)
      self._do_get(resource, query)
    end

    protected

    def _do_get(resource, query)
      response = RestClient::Request.execute(
        :url => self._prepare_rest_url(resource),
        :method => :get,
        :timeout => self.timeout,

        :user => @auth["user_id"],
        :password => @auth["secret_key"],

        :headers => {
          :user_agent => "enrich-api-ruby/2.0.0",
          :accept => :json,
          :content_type => :json,
          :params => query
        }
      )

      return JSON.parse(response)
    end

    def _prepare_rest_url(resource)
      return self.rest_host + self.rest_base_path + resource
    end
  end
end
