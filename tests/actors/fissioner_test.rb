# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../test/interfaces/fissioner_interface_test'
require_relative '../../actors/fissioner'

class FissionerTest < Minitest::Test
  include FissionerInterfaceTest
  def setup
    foodchain = { 'sterile_critter' => {size: 2, prey: 'fertile_critter'},
                  'fertile_critter' => {size: 2, prey: 'none'} }
    @creatures = MockCreatures.new(foodchain: foodchain)
    @fis = @object =Fissioner.new
    def @fis.child_color(critter); 'red'; end
  end

  def test_reproduce_returns_nil
    assert_nil @fis.reproduce(creatures: @creatures)
  end

  def test_reproduce_only_creates_child_for_fertile_critters
    @fis.reproduce(creatures: @creatures)
    assert_equal 2, @creatures.census['sterile_critter'].count
    assert_equal 4, @creatures.census['fertile_critter'].count
  end
end
