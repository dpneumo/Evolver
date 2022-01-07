# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/critter'
require_relative '../models/fissioner'

class FissionerTest < Minitest::Test
  def setup
    @mockfert0 = MockFertility0
    @mockfert1 = MockFertility1
    @tb0 = Toolbox.new(fertility: @mockfert0)
    @tb1 = Toolbox.new(fertility: @mockfert1)
    @critters = [ Critter.new(toolbox: @tb0), Critter.new(toolbox: @tb0) ]
  end

  def test_birth_does_not_create_child_for_fertility_probability_0
    fis = Fissioner.new(toolbox: @tb0)
    assert_equal 2, @critters.count
    assert_equal 2, fis.birth(critters: @critters).count
  end

  def test_birth_creates_child_for_fertility_probability_1
    fis = Fissioner.new(toolbox: @tb1)
    assert_equal 2, @critters.count
    assert_equal 4, fis.birth(critters: @critters).count
  end
end
