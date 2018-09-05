class Scoppa
  class Hand
    attr_reader :cards

    def initialize
      @cards = []
    end

    def add_card(card)
      @cards << card
    end

    def remove_card(card)
      @cards.reject! { |c| c == card }
    end
  end
end
