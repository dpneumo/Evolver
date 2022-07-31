# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/critter/critter'
require_relative '../../actors/reaper'

class ReaperTest < Minitest::Test
  def setup
    foodchain = { 'sterile' => {size: 2, prey: 'fertile'},
                  'fertile' => {size: 2, prey: 'none'} }
    @mockcreatures = MockCreatures.new(foodchain: foodchain, baselink: 'none')
    @mockstats = MockStats.new(store: MockStatStore.new)
    @reaper = Reaper.new(stats: @mockstats)
  end

  def test_survive_returns_nil
    assert_nil @reaper.survive(creatures: @mockcreatures)
  end

  def test_only_viable_critters_survive
    assert_equal 2, @mockcreatures.census['sterile'].count
    assert_equal 2, @mockcreatures.census['fertile'].count
    @reaper.survive(creatures: @mockcreatures)
    assert_equal 0, @mockcreatures.census['sterile'].count
    assert_equal 2, @mockcreatures.census['fertile'].count
  end
end
