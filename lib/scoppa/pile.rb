class Scoppa
  class Pile
    attr_reader :brooms, :cards
    
    def initialize
      @brooms = 0
      @cards = []
    end

    def add_broom
      @brooms += 1
    end

    def add_cards(cards)
      @cards += cards
    end

    def score
      total = 0
      total += 1 if total_cards > 20
      total += 1 if total_hearts > 5
      total += 1 if total_sevens > 2
      total += 1 if seven_of_hearts?
      total += 1 if ten_of_hearts?
      total += @brooms
      total
    end

    private

    def seven_of_hearts?
      @cards.detect do |card|
        card.suit == 'hearts' && card.value == 7
      end
    end

    def ten_of_hearts?
      @cards.detect do |card|
        card.suit == 'hearts' && card.value == 10
      end
    end

    def total_cards
      @cards.length
    end

    def total_hearts
      @cards.select { |card| card.suit == 'hearts' }.length
    end

    def total_sevens
      @cards.select { |card| card.value == 7 }.length
    end
  end
end
