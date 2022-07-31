# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../actors/publisher'
require_relative '../../tests/test_mocks'

class PublisherTest < Minitest::Test
  def setup
    mockstats = MockStats.new(store: MockStatStore.new)
    @publisher = Publisher.new(stats: mockstats, statements: MockStatements)
  end

  def test_publish_returns_nil
    assert_nil @publisher.publish
  end

  def test_publishes_a_stats_summary
  	assert_output(nil) { @publisher.publish }
  end
end
