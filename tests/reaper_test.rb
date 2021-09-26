# frozen_string_literal: true

require_relative '../models/critter'
require_relative '../utilities/toolbox'
require_relative '../models/reaper'
require_relative 'test_helper'

class ReaperTest < Minitest::Test
  def setup
    @mockidgen1 = MockIDGenerator1
    @mockidgen2 = MockIDGenerator2
    @mockmort0 = MockMortality0
    @mockmort1 = MockMortality1
    @tb0 = Toolbox.new(id_generator: @mockidgen1, mortality: @mockmort0)
    @tb1 = Toolbox.new(id_generator: @mockidgen1, mortality: @mockmort1)
    @critters = [ Critter.new(@tb0), Critter.new(@tb0) ]
  end

  def test_survive_returns_all_critters_for_mortality_probability_0
    reap = Reaper.new(@tb0)
    assert_equal 2, reap.survive(@critters).count
  end

  def test_survive_returns_no_critters_for_mortality_probability_1
    reap = Reaper.new(@tb1)
    assert_equal 0, reap.survive(@critters).count
  end
end
