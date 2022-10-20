# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/runner_interface_test'
require_relative '../mocks'

class MockRunnerTest < Minitest::Test
  include RunnerInterfaceTest

  def setup
    @runner = @object = MockRunner.new
  end

  def test_run_returns_nil
    assert_nil @runner.run(periods: 3)
  end

  def test_show_stats_returns_nil
    assert_nil @runner.show_stats
  end
end
