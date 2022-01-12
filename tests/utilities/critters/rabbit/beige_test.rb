# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../../utilities/critters/rabbit/beige'
require_relative '../../../test_helper'

class Tests::Utilities::Critters::Rabbit::BeigeTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Rabbit::Beige.new
  end

  def test_rabbit_color_name_is_beige
    assert_equal 'beige', @clr.name
  end

  def test_beige_rabbit_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
