# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../actors/creatures'
require_relative '../../actors/consumer'
require_relative '../../actors/runner'

class RunnerTest < Minitest::Test
  def setup
    @runner = Runner.new( stats: MockStats, statstore: MockStatStore,
                          creatures: MockCreatures, consumer: MockConsumer,
                          publisher: MockPublisher )
  end

  def test_run_returns_nil
    assert_nil @runner.run(periods: 3)
  end

  def test_show_stats_returns_nil
    assert_nil @runner.show_stats
  end
end
