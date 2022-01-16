# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/population'

class PopulationTest < Minitest::Test
  def setup
    @mocktb = MockToolbox
    @mockpub = MockPublisher
  end

  def test_run
    pop = Population.new(initial_pop_size: 2, toolbox: @mocktb, publisher: @mockpub)
    assert_equal 3, pop.run(periods: 3)
  end
end
