class Scoppa
  class Deck
    attr_reader :cards

    def initialize
      @cards = []
      suits.each do |suit|
        values.each do |value|
          @cards << Card.new(suit, value)
        end
      end
    end
    
    def deal(number)
      @cards.shift(number)
    end

    def shuffle!
      @cards.shuffle!
    end

    private

    def suits
      %w(spades hearts diamonds clubs)
    end

    def values
      (1..10).to_a
    end
  end
end