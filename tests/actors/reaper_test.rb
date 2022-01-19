# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/reaper'

class ReaperTest < Minitest::Test
  def setup
    @mockidgen1 = MockIDGenerator1
    @mockidgen2 = MockIDGenerator2
    @mockvit0 = MockVitality0
    @mockvit1 = MockVitality1
    @tb0 = Toolbox.new(id_generator: @mockidgen1, vitality: @mockvit0)
    @tb1 = Toolbox.new(id_generator: @mockidgen1, vitality: @mockvit1)
    @critters = [ Critter.new(toolbox: @tb0), Critter.new(toolbox: @tb0) ]
  end

  def test_survive_returns_all_critters_for_vitality_probability_0
    reap = Reaper.new(toolbox: @tb0)
    assert_equal 2, reap.survive(critters: @critters).count
  end

  def test_survive_returns_no_critters_for_vitality_probability_1
    reap = Reaper.new(toolbox: @tb1)
    assert_equal 0, reap.survive(critters: @critters).count
  end
end
