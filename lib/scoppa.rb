class Scoppa
  attr_reader :deck

  def initialize
    @deck = Deck.new
  end
end

require 'scoppa/card'
require 'scoppa/hand'
require 'scoppa/deck'
require 'scoppa/pile'
require 'scoppa/player'
