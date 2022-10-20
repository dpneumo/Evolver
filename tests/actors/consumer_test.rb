# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../test/interfaces/consumer_interface_test'
require_relative '../../actors/consumer'

class ConsumerTest < Minitest::Test
  include ConsumerInterfaceTest
  def setup
    @cnsmr = @object = Consumer.new
    foodchain = { 'fertile_critter' => {size: 1, prey: 'vital_critter'},
                  'vital_critter' => {size: 2, prey: 'sterile_critter'},
                  'sterile_critter' => {size: 0, prey: 'none'} }
    @crturs = MockCreatures.new(foodchain: foodchain)
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
