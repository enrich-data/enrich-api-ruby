##
# graphmob-api-node
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rubygems'
require 'rest-client'

require 'resources/enrich'
require 'resources/search'
require 'resources/verify'

module Graphmob
  class Client
    attr_writer :rest_host
    attr_writer :rest_base_path

    attr_accessor :enrich
    attr_accessor :search
    attr_accessor :verify

    def initialize()
      @auth = {}

      @enrich = Graphmob::Enrich.new(self)
      @search = Graphmob::Search.new(self)
      @verify = Graphmob::Verify.new(self)
    end

    public

    def authenticate(user_id, secret_key)
      @auth["user_id"] = user_id
      @auth["secret_key"] = secret_key
    end

    def rest_host
      @rest_host || "https://api.graphmob.com"
    end

    def rest_base_path
      @rest_base_path || "/v1"
    end

    def timeout
      @timeout || 5
    end

    protected

    def _get(resource, query)
      # TODO: retries

      return JSON.parse(
        RestClient::Request.execute(
          :url => @__prepare_rest_url(resource),
          :method => :get,
          :timeout => self.timeout,

          :user => @auth["user_id"],
          :password => @auth["secret_key"],

          :headers => {
            params: query
          }
        )
      )
    end

    private

    def __prepare_rest_url(resource)
      return self.rest_host + self.rest_base_path + resource
    end
  end
end
