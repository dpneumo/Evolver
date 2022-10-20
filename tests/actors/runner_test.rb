# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../test/interfaces/runner_interface_test'
require_relative '../../actors/runner'

class RunnerTest < Minitest::Test
  include RunnerInterfaceTest
  def setup
    foodchain = { 'fertile_critter' => { size: 1, prey: 'vital_critter' },
                  'vital_critter' => { size: 2, prey: 'sterile_critter' } }
    @runner = @object = Runner.new( foodchain: foodchain,
                          creatures: MockCreatures, 
                          consumer: MockConsumer,
                          fissioner: MockFissioner,
                          reaper: MockReaper,
                          stats: MockStats, statstore: MockStatStore,
                          publisher: MockPublisher )
  end

  def test_run_returns_nil
    assert_nil @runner.run(periods: 3)
  end

  def test_show_stats_returns_nil
    assert_nil @runner.show_stats
  end
end
