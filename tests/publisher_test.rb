# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/publisher'

class PublisherTest < Minitest::Test
  def test_publishes_a_stats_summary
  	toolbox = MockToolbox.new
  	@publisher = Publisher.new(toolbox: toolbox)
  	expected = "pop stats by period:
period: 1, species: coyote, population: 2, mean age: 1.0
period: 2, species: coyote, population: 3, mean age: 1.33

mean age at death by_species:
species: coyote, mean_age_at_death: 4.67
"
  	assert_output(expected) {@publisher.publish}
  end
end
