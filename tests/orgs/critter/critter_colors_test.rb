# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/critter/critter_colors'

class CritterObj; extend CritterColors; end

class CritterColorsTest < Minitest::Test
  def test_mutation_probabilities_sum_to_1_for_each_color
    CritterObj.mutations.each do |_, mutation|
      assert_equal 1.00, mutation.values.sum
    end
  end
end
