# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/publisher_interface_test'
require_relative '../mocks'

class MockPublisherTest < Minitest::Test
  include PublisherInterfaceTest

  def setup
    store = MockStatStore.new
    stats = MockStats.new(store:)
    @pub = @object = MockPublisher.new(stats:)
  end

  def test_publish_returns_nil
    assert_nil @pub.publish
  end
end
