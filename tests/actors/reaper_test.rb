# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/reaper'

class ReaperTest < Minitest::Test
  def test_only_viable_critters_survive
    creatures = MockCreatures.new
    mockstats = MockStats.new(store: MockStatStore.new)
    reap = Reaper.new(stats: mockstats)

    assert_nil reap.survive(creatures: creatures)
    assert_equal 0, creatures.census['sterile'].count
    assert_equal 2, creatures.census['fertile'].count
  end
end
