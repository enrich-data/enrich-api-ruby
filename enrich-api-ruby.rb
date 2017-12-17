Gem::Specification.new do |s|
  s.name          = 'enrich-api'
  s.version       = '1.1.1'
  s.date          = Date.today
  s.summary       = "Enrich API Ruby"
  s.description   = "Enrich API Ruby"
  s.authors       = ["Valerian Saliou"]
  s.email         = 'valerian@valeriansaliou.name'
  s.files         = `git ls-files`.split($/)
  s.homepage      = 'https://enrichdata.com'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.add_dependency 'rest-client', '~> 2.0.0'
end
