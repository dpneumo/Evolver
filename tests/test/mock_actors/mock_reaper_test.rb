# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/reaper_interface_test'
require_relative '../mocks'

class MockReaperTest < Minitest::Test
  include ReaperInterfaceTest

  def setup
    @mockcreatures = MockCreatures.new(foodchain: {})
    @mockstats = MockStats.new(store: MockStatStore.new)
    @reaper = @object = MockReaper.new(stats: @mockstats)
  end

  def test_survive_returns_nil
    assert_nil @reaper.survive(creatures: @mockcreatures)
  end
end
