##
# enrich-api-ruby
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rest-client'

module Enrich
  class EnrichResource
    def initialize(parent)
      @parent = parent
    end

    def person(query)
      return @parent._get("/enrich/person", query)
    end

    def network(query)
      return @parent._get("/enrich/network", query)
    end
  end
end
