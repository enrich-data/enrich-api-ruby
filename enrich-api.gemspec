require File.expand_path("../lib/enrich-api", __FILE__)

Gem::Specification.new do |s|
  s.name          = 'enrich-api'
  s.version       = '2.0.0'
  s.date          = Date.today
  s.summary       = "Enrich API Ruby"
  s.description   = "Enrich API Ruby"
  s.authors       = ["Valerian Saliou"]
  s.email         = 'valerian@valeriansaliou.name'
  s.files         = `git ls-files`.split($/)
  s.homepage      = 'https://enrich.email'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.add_dependency 'rest-client', '~> 2.0.0'
end
