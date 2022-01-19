# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/coyote/coyote_colors'

class CoyoteObj; extend CoyoteColors; end

class CoyoteColorsTest < Minitest::Test
  def test_mutation_probabilities_sum_to_1_for_each_color
    CoyoteObj.mutations.each do |_, mutation|
      assert_equal 1.00, mutation.values.sum
    end
  end
end
