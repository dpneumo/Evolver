# frozen_string_literal: true

require_relative '../models/publisher'
require_relative 'test_helper'

class PublisherTest < Minitest::Test
  def test_publishes_a_stats_summary
  	toolbox = MockToolbox.new
  	@publisher = Publisher.new(toolbox: toolbox)
  	expected = "period: 1, population: 2, mean age: 1.0
period: 2, population: 3, mean age: 1.33

mean age at death (all): 4.67
mean age at death (test_color): 0
mean age at death (red): 4.0
mean age at death (green): 5.0
"
  	assert_output(expected) {@publisher.publish}
  end
end
