# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../tests/test/mocks'
require_relative '../test/interfaces/publisher_interface_test'
require_relative '../../actors/publisher'

class PublisherTest < Minitest::Test
  include PublisherInterfaceTest
  def setup
    mockstats = MockStats.new(store: MockStatStore.new)
    @publisher = @object = Publisher.new(stats: mockstats, statements: MockStatements)
  end

  def test_publish_returns_nil
    assert_nil @publisher.publish
  end

  def test_publishes_a_stats_summary
  	assert_output(nil) { @publisher.publish }
  end
end
