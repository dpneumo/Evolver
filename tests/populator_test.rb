# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/critter'
require_relative '../models/rabbit'
require_relative '../models/coyote'
require_relative '../utilities/populator'

class PopulatorTest < Minitest::Test
  def test_populate_returns_array_of_critters
    toolbox = Toolbox.new
    population = Populator.new(toolbox: toolbox).populate(size: 10, species: Critter)
    assert population.is_a? Array
    assert_equal 10, population.size
  end
end
