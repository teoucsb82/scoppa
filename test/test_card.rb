require 'minitest/autorun'
require 'scoppa'

describe Scoppa::Card do
  describe '#to_s' do
    it 'returns the name of the card' do
      assert_equal('2 of Clubs', Scoppa::Card.new("clubs", 2).to_s)
      assert_equal('3 of Diamonds', Scoppa::Card.new("diamonds", 3).to_s)
      assert_equal('4 of Hearts', Scoppa::Card.new("hearts", 4).to_s)
      assert_equal('5 of Spades', Scoppa::Card.new("spades", 5).to_s)
    end

    it 'converts 1s to Aces' do
      assert_equal('Ace of Clubs', Scoppa::Card.new("clubs", 1).to_s)
    end
  end
end
