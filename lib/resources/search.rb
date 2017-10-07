##
# enrich-api-ruby
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'rest-client'

module Enrich
  class SearchResource
    def initialize(parent)
      @parent = parent
    end

    def lookup_people(query, page_number = 1)
      return @parent._get("/search/lookup/people/#{page_number}", query)
    end

    def lookup_companies(query, page_number = 1)
      return @parent._get("/search/lookup/companies/#{page_number}", query)
    end

    def lookup_emails(query, page_number = 1)
      return @parent._get("/search/lookup/emails/#{page_number}", query)
    end

    def suggest_companies(query, page_number = 1)
      return @parent._get("/search/suggest/companies/#{page_number}", query)
    end
  end
end
