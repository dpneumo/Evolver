# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/reaper'

class ReaperTest < Minitest::Test
  def setup
    @reap = Reaper.new(toolbox: MockToolbox.new)
  end

  def test_survive_returns_all_critters_for_survival_probability_1
    critters = [MockCritter1.new, MockCritter1.new]
    assert_equal 2, @reap.survive(critters: critters).count
  end

  def test_survive_returns_no_critters_for_survival_probability_0
    critters = [MockCritter0.new, MockCritter0.new]
    assert_equal 0, @reap.survive(critters: critters).count
  end
end
