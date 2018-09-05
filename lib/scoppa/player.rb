class Scoppa
  class Player
    attr_reader :hand
    attr_reader :pile
    attr_accessor :score

    def initialize
      @score = 0
      @hand = Scoppa::Hand.new
      @pile = Scoppa::Pile.new
    end
  end
end
