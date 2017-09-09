##
# graphmob-api-node
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rest-client'

module Graphmob
  class Enrich
    def initialize(parent)
      @parent = parent
    end

    def person(query)
      return @parent._get("/enrich/person", query)
    end

    def company(query)
      return @parent._get("/enrich/company", query)
    end

    def network(query)
      return @parent._get("/enrich/network", query)
    end
  end
end
