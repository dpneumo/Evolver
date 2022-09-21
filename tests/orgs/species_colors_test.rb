# frozen_string_literal: true

require_relative '../test_helper'

['Critter', 'Coyote', 'Rabbit', 'Carrot'].each do |sp|
  species = sp.downcase
  require_relative "../../orgs/#{species}/#{species}_parms"
  eval <<~DYNAMIC
    class SpeciesObj
      extend #{sp}Parms
    end

    class #{sp}ColorsTest < Minitest::Test
      def test_colors_returns_array_of_strings
        assert SpeciesObj.colors.is_a? Array
        SpeciesObj.colors.each do |color|
          assert color.is_a? String
        end
      end

      def test_mutation_probabilities_sum_to_1_for_each_color
        SpeciesObj.mutations.each do |_, mutation|
          assert_equal 1.00, mutation.values.sum
        end
      end
    end
  DYNAMIC
end
