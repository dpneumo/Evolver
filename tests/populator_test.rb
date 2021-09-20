# frozen_string_literal: true

require_relative '../models/critter'
require_relative '../utilities/id_generator'
require_relative '../utilities/populator'
require_relative 'test_helper'

class PopulatorTest < Minitest::Test
  def test_populate_returns_array_of_critters
    population = Populator.new(IDGenerator.new).populate(10)
    assert population.is_a? Array
    assert_equal 10, population.size
  end
end
