require 'minitest/autorun'
require 'scoppa'

describe Scoppa::Hand do
  before do
    @hand = Scoppa::Hand.new
  end

  describe '#add_card' do
    it 'adds a card to the hand' do
      card = Scoppa::Card.new('clubs', 2)
      refute_includes(@hand.cards, card)

      @hand.add_card(card)
      assert_includes(@hand.cards, card)
    end
  end

  describe '#remove_card' do
    it 'removes a card from the hand' do
      card = Scoppa::Card.new('clubs', 2)
      @hand.add_card(card)
      assert_includes(@hand.cards, card)

      @hand.remove_card(card)
      refute_includes(@hand.cards, card)
    end
  end
end
