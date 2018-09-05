require 'minitest/autorun'
require 'scoppa'

describe Scoppa do
  before do
    @scoppa = Scoppa.new
  end

  describe "#deck" do
    it "returns a Deck object" do
      @scoppa.deck.class.must_equal Scoppa::Deck
    end
  end
end