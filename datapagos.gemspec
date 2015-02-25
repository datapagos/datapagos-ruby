Gem::Specification.new do |s|
  s.name        = 'datapagos'
  s.version     = '0.1.5'
  s.date        = '2014-06-23'
  s.summary     = "DataPagos API client"
  s.description = "A client of the DataPagos API"
  s.authors     = [ "German Escobar", "Simon Soriano", "Ricardo Arenas" ]
  s.email       = 'german.escobar@elibom.com'
  s.files       = ["lib/datapagos.rb", "lib/datapagos/token.rb", "lib/datapagos/charge.rb", "lib/datapagos/subscription.rb"]
  s.homepage    = 'http://rubygems.org/gems/datapagos'

  s.add_dependency('json')
end