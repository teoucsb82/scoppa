Gem::Specification.new do |s|
  s.name        = 'scoppa'
  s.version     = '0.0.1'
  s.date        = '2018-09-03'
  s.summary     = 'Scoppa Card Game'
  s.description = 'Ruby version of Scoppa (Italian Card Game)'
  s.authors     = ["Teo Dell'Amico"]
  s.email       = 'teo@dellamico.com'
  s.files       = [
    'lib/scoppa.rb',
    'lib/scoppa/card.rb',
    'lib/scoppa/deck.rb',
    'lib/scoppa/hand.rb',
    'lib/scoppa/pile.rb',
    'lib/scoppa/player.rb'
  ]
  s.homepage    = 'https://rubygems.org/gems/scoppa'
  s.license     = 'MIT'
end
