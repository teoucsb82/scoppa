require 'minitest/autorun'
require 'scoppa'

describe Scoppa::Deck do
  before do
    @deck = Scoppa::Deck.new
  end

  describe '#cards' do
    it 'has 40 cards' do
      @cards = @deck.cards
      assert_equal(40, @cards.length)
      assert_equal(Scoppa::Card, @cards.first.class)
    end
  end

  describe '#shuffle!' do
    it 'randomizes the cards' do
      fresh_deck = Scoppa::Deck.new.cards.map(&:to_s)
      assert_equal(@deck.cards.map(&:to_s), fresh_deck)
      @deck.shuffle!
      refute_equal(@deck.cards.map(&:to_s), fresh_deck)
    end
  end

  describe '#deal' do
    it 'returns an array of cards' do
      deal = @deck.deal(2)
      assert_equal(Array, deal.class)
      assert_equal(2, deal.length)
    end

    it 'removes those cards from the top of the deck' do
      assert_equal(40, @deck.cards.length)
      @deck.deal(5)
      assert_equal(35, @deck.cards.length)
    end
  end
end
