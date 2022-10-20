# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/fissioner_interface_test'
require_relative '../mocks'

class MockFissionerTest < Minitest::Test
  include FissionerInterfaceTest

  def setup
    foodchain = { }
    @creatures = MockCreatures.new(foodchain: foodchain)
    @fis = @object = MockFissioner.new
  end

  def test_reproduce_returns_nil
    assert_nil @fis.reproduce(creatures: @creatures)
  end
end
