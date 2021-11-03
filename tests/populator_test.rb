# frozen_string_literal: true

require_relative '../utilities/toolbox'
require_relative '../models/critter'
require_relative '../utilities/populator'
require_relative 'test_helper'

class PopulatorTest < Minitest::Test
  def test_populate_returns_array_of_critters
    toolbox = Toolbox.new
    population = Populator.new(toolbox).populate(10, Critter)
    assert population.is_a? Array
    assert_equal 10, population.size
  end
end
