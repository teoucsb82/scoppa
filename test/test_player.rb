require 'minitest/autorun'
require 'scoppa'

describe Scoppa::Player do
  before do
    @player = Scoppa::Player.new
  end

  describe '#hand' do
    it 'is a Scoppa::Hand' do
      assert_equal(Scoppa::Hand, @player.hand.class)
    end
  end

  describe '#pile' do
    it 'is a Scoppa::Pile' do
      assert_equal(Scoppa::Pile, @player.pile.class)
    end
  end

  describe '#score' do
    it 'starts at 0' do
      assert_equal(0, @player.score)
    end

    it 'can be modified' do
      @player.score += 4
      assert_equal(4, @player.score)
    end
  end
end
