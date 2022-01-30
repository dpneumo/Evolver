# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/fissioner'

class FissionerTest < Minitest::Test
  def setup
    @tb = Toolbox.new
    @critter0 = Critter.new
    @critter1 = Critter.new
  end

  def test_birth_does_not_create_child_for_fertility_probability_0
    fis = Fissioner.new(toolbox: @tb)
    critters = [ @critter0, @critter1 ]
    assert_equal 2, critters.count
    assert_equal 2, fis.birth(critters: critters).count
  end

  def test_birth_creates_child_for_fertility_probability_1
    fis = Fissioner.new(toolbox: @tb)
    @critter0.age = 3
    @critter1.age = 3
    critters = [ @critter0, @critter1 ]
    assert_equal 2, critters.count
    newcrits = fis.birth(critters: critters)
    assert_equal 4, newcrits.count
  end
end
