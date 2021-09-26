# frozen_string_literal: true

require_relative '../models/critter'
require_relative '../utilities/toolbox'
require_relative '../models/fissioner'
require_relative 'test_helper'

class FissionerTest < Minitest::Test
  def setup
    @mockidgen1 = MockIDGenerator1
    @mockidgen2 = MockIDGenerator2
    @mockfert0 = MockFertility0
    @mockfert1 = MockFertility1
    @tb0 = Toolbox.new(id_generator: @mockidgen1, fertility: @mockfert0)
    @tb1 = Toolbox.new(id_generator: @mockidgen1, fertility: @mockfert1)
    @critters = [ Critter.new(@tb0), Critter.new(@tb0) ]
  end

  def test_birth_does_not_create_child_for_fertility_probability_0
    fis = Fissioner.new(@tb0)
    assert_equal 2, fis.birth(@critters).count
    @critters.each {|c| assert c.children_ids.empty? }
  end

  def test_birth_creates_child_for_fertility_probability_1
    fis = Fissioner.new(@tb1)
    assert_equal 4, fis.birth(@critters).count
    @critters.each {|c| assert_equal 1, c.children_ids.count }
  end
end
