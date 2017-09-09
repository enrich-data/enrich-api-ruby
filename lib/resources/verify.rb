##
# graphmob-api-node
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rest-client'

module Graphmob
  class Verify
    def initialize(parent)
      @parent = parent
    end

    def validate_email(query)
      return @parent._get("/verify/validate/email", query)
    end

    def format_email(query)
      return @parent._get("/verify/format/email", query)
    end
end
