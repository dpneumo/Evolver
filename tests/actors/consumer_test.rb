# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/consumer'

class ConsumerTest < Minitest::Test
  def setup
    @cnsmr = Consumer.new
    foodchain = { 'coyote' => {size: 1, prey: 'rabbit'},
                  'rabbit' => {size: 2, prey: 'critter'},
                  'critter' => {size: 0, prey: 'none'} }
    @crturs = MockCreatures.new(foodchain: foodchain, baselink: 'none')
  end

  def test_encounters_does_not_replace_the_creatures_instance_provided
    supplied = @crturs.object_id
    @cnsmr.encounters(creatures: @crturs)
    assert_equal supplied, @crturs.object_id
  end

  def test_encounters_returns_nil
    assert_nil @cnsmr.encounters(creatures: @crturs)
  end
end