class Scoppa
  attr_reader :deck

  def initialize
    @deck = Deck.new
  end
end

require 'scoppa/deck'
require 'scoppa/card'