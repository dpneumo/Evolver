# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../actors/creatures'
require_relative '../../actors/consumer'
require_relative '../../actors/runner'

class RunnerTest < Minitest::Test
  def setup
    foodchain = { 'coyote' => {size: 1, prey: 'rabbit'},
                  'rabbit' => {size: 2, prey: 'carrot'} }
    @runner = Runner.new( foodchain: foodchain, baselink: 'carrot',
                          creatures: MockCreatures, consumer: MockConsumer,
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
