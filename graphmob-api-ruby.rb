Gem::Specification.new do |s|
  s.name          = 'graphmob-api-ruby'
  s.version       = '1.0.0'
  s.date          = Date.today
  s.summary       = "Graphmob API Ruby"
  s.description   = "Graphmob API Ruby"
  s.authors       = ["Valerian Saliou"]
  s.email         = 'valerian@valeriansaliou.name'
  s.files         = `git ls-files`.split($/)
  s.homepage      = 'https://graphmob.com'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.add_dependency 'rest-client', '~> 2.0.0'
end
