# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/consumer_interface_test'
require_relative '../mocks'

class MockConsumerTest < Minitest::Test
  include ConsumerInterfaceTest
  def setup
    @cnsmr = @object = MockConsumer.new
  end
end
