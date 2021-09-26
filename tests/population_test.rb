# frozen_string_literal: true

require_relative '../utilities/toolbox'
require_relative '../models/population'
require_relative 'test_helper'

class PopulationTest < Minitest::Test
  def setup
    @mocktb = MockToolbox
    @mockpub = MockPublisher
  end

  def test_run
    pop = Population.new(toolbox: @mocktb, publisher: @mockpub)
    assert_equal 'Stats', pop.run(periods: 1)
  end
end
