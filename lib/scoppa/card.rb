class Scoppa
  class Card
    attr_reader :suit, :value

    def initialize(suit, value)
      @suit = suit
      @value = value
    end

    def to_s
      val = 
        case value
        when 1 then 'Ace'
        else value
        end
      "#{val} of #{suit.capitalize}"
    end
  end
end
