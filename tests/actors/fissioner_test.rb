# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/fissioner'

class FissionerTest < Minitest::Test
  def setup
    foodchain = { 'sterile' => {size: 2, prey: 'fertile'},
                  'fertile' => {size: 2, prey: 'none'} }
    @creatures = MockCreatures.new(foodchain: foodchain)
    @fis = Fissioner.new
    def @fis.child_color(critter); 'red'; end
  end

  def test_reproduce_returns_nil
    assert_nil @fis.reproduce(creatures: @creatures)
  end

  def test_reproduce_only_creates_child_for_fertile_critters
    @fis.reproduce(creatures: @creatures)
    assert_equal 2, @creatures.census['sterile'].count
    assert_equal 4, @creatures.census['fertile'].count
  end
end
