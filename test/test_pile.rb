require 'minitest/autorun'
require 'scoppa'

describe Scoppa::Pile do
  before do
    @pile = Scoppa::Pile.new
  end

  describe '#add_broom' do
    it 'adds a broom to the pile' do
      assert_equal(0, @pile.brooms)
      @pile.add_broom
      assert_equal(1, @pile.brooms)
    end
  end

  describe '#add_cards' do
    it 'adds cards to the array' do
      card_1 = Scoppa::Card.new('clubs', 4)
      card_2 = Scoppa::Card.new('clubs', 5)
      card_3 = Scoppa::Card.new('clubs', 6)
      cards = [card_1, card_2, card_3]

      assert_equal(0, @pile.cards.length)
      refute_equal(cards, @pile.cards)
      @pile.add_cards(cards)
      assert_equal(3, @pile.cards.length)
      assert_equal(cards, @pile.cards)
    end
  end

  describe '#score' do
    it 'returns the score for the pile' do
      assert_equal(0, @pile.score)
    end

    it 'awards 1 point for most cards' do
      cards = 21.times.map { Scoppa::Card.new('clubs', 2) }
      @pile.add_cards(cards)
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for most hearts' do
      cards = 6.times.map { Scoppa::Card.new('hearts', 2) }
      @pile.add_cards(cards)
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for most 7s' do
      cards = []
      cards << Scoppa::Card.new('spades', 7)
      cards << Scoppa::Card.new('diamonds', 7)
      cards << Scoppa::Card.new('clubs', 7)
      @pile.add_cards(cards)
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for 7 of hearts' do
      cards = [Scoppa::Card.new('hearts', 7)]
      @pile.add_cards(cards)
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for 10 of hearts' do
      cards = [Scoppa::Card.new('hearts', 10)]
      @pile.add_cards(cards)
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for each broom' do
      @pile.add_broom
      @pile.add_broom
      assert_equal(2, @pile.score)
    end

    it 'rewards maximum of 5 natural points' do
      cards = Scoppa::Deck.new.cards
      @pile.add_cards(cards)
      assert_equal(5, @pile.score)
    end

    describe 'mixed cases' do
      it 'only counts 1 point for 7 of hearts, not total 7s' do
        cards = []
        cards << Scoppa::Card.new('hearts', 7)
        cards << Scoppa::Card.new('clubs', 7)
        @pile.add_cards(cards)
        assert_equal(1, @pile.score)
      end

      it 'counts 3 points for hearts, 7 of hearts, 10 of hearts' do
        cards = []
        cards << Scoppa::Card.new('hearts', 1)
        cards << Scoppa::Card.new('hearts', 2)
        cards << Scoppa::Card.new('hearts', 3)
        cards << Scoppa::Card.new('hearts', 4)
        cards << Scoppa::Card.new('hearts', 7)
        cards << Scoppa::Card.new('hearts', 10)
        @pile.add_cards(cards)
        assert_equal(3, @pile.score)
      end

      it 'counts 4 points for cards, hearts, total 7s, 7 of hearts' do
        cards = []
        cards += 20.times.map { Scoppa::Card.new('clubs', 1) }
        cards << Scoppa::Card.new('hearts', 1)
        cards << Scoppa::Card.new('hearts', 2)
        cards << Scoppa::Card.new('hearts', 3)
        cards << Scoppa::Card.new('hearts', 4)
        cards << Scoppa::Card.new('hearts', 5)
        cards << Scoppa::Card.new('hearts', 7)
        cards << Scoppa::Card.new('diamonds', 7)
        cards << Scoppa::Card.new('clubs', 7)
        @pile.add_cards(cards)
        assert_equal(4, @pile.score)
      end
    end
  end
end
