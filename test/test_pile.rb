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

  describe '#add_card' do
    it 'adds a card to the pile' do
      card = Scoppa::Card.new('clubs', 2)
      assert_equal(0, @pile.cards.length)
      @pile.add_card(card)
      assert_equal(1, @pile.cards.length)
      assert_equal([card], @pile.cards)
    end
  end

  describe '#score' do
    it 'returns the score for the pile' do
      assert_equal(0, @pile.score)
    end

    it 'awards 1 point for most cards' do
      21.times do
        @pile.add_card(Scoppa::Card.new('clubs', 2))
      end
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for most hearts' do
      6.times do
        @pile.add_card(Scoppa::Card.new('hearts', 2))
      end
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for most 7s' do
      @pile.add_card(Scoppa::Card.new('spades', 7))
      @pile.add_card(Scoppa::Card.new('diamonds', 7))
      @pile.add_card(Scoppa::Card.new('clubs', 7))
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for 7 of hearts' do
      @pile.add_card(Scoppa::Card.new('hearts', 7))
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for 10 of hearts' do
      @pile.add_card(Scoppa::Card.new('hearts', 10))
      assert_equal(1, @pile.score)
    end

    it 'awards 1 point for each broom' do
      @pile.add_broom
      @pile.add_broom
      assert_equal(2, @pile.score)
    end

    it 'rewards maximum of 5 natural points' do
      Scoppa::Deck.new.cards.each do |card|
        @pile.add_card(card)
      end
      assert_equal(5, @pile.score)
    end

    describe 'mixed cases' do
      it 'only counts 1 point for 7 of hearts, not total 7s' do
        @pile.add_card(Scoppa::Card.new('hearts', 7))
        @pile.add_card(Scoppa::Card.new('clubs', 7))
        assert_equal(1, @pile.score)
      end

      it 'counts 3 points for hearts, 7 of hearts, 10 of hearts' do
        @pile.add_card(Scoppa::Card.new('hearts', 1))
        @pile.add_card(Scoppa::Card.new('hearts', 2))
        @pile.add_card(Scoppa::Card.new('hearts', 3))
        @pile.add_card(Scoppa::Card.new('hearts', 4))
        @pile.add_card(Scoppa::Card.new('hearts', 7))
        @pile.add_card(Scoppa::Card.new('hearts', 10))
        assert_equal(3, @pile.score)
      end

      it 'counts 4 points for cards, hearts, total 7s, 7 of hearts' do
        20.times do
          @pile.add_card(Scoppa::Card.new('clubs', 1))
        end
        @pile.add_card(Scoppa::Card.new('hearts', 1))
        @pile.add_card(Scoppa::Card.new('hearts', 2))
        @pile.add_card(Scoppa::Card.new('hearts', 3))
        @pile.add_card(Scoppa::Card.new('hearts', 4))
        @pile.add_card(Scoppa::Card.new('hearts', 5))
        @pile.add_card(Scoppa::Card.new('hearts', 7))
        @pile.add_card(Scoppa::Card.new('diamonds', 7))
        @pile.add_card(Scoppa::Card.new('clubs', 7))
        assert_equal(4, @pile.score)
      end
    end
  end
end
