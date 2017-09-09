##
# graphmob-api-ruby
#
# Copyright 2017, Valerian Saliou
# Author: Valerian Saliou <valerian@valeriansaliou.name>
##

require 'graphmob'

client = Graphmob::Client.new

client.authenticate(
  "ui_a311da78-6b89-459c-8028-b331efab20d5",
  "sk_f293d44f-675d-4cb1-9c78-52b8a9af0df2"
)

data = client.verify.format_email({
  email_domain: "crisp.chat",
  first_name: "Valerian",
  last_name: "Saliou"
})

puts data.inspect
