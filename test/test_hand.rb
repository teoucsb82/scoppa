require 'minitest/autorun'
require 'scoppa'

describe Scoppa::Hand do
  before do
    @hand = Scoppa::Hand.new
  end

  describe '#add_cards' do
    it 'adds cards to the array' do
      card_1 = Scoppa::Card.new('clubs', 4)
      card_2 = Scoppa::Card.new('clubs', 5)
      card_3 = Scoppa::Card.new('clubs', 6)
      cards = [card_1, card_2, card_3]

      assert_equal(0, @hand.cards.length)
      refute_equal(cards, @hand.cards)
      @hand.add_cards(cards)
      assert_equal(3, @hand.cards.length)
      assert_equal(cards, @hand.cards)
    end
  end
end
