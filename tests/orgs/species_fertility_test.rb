# frozen_string_literal: true

require_relative '../test_helper'

['Critter', 'Coyote', 'Rabbit', 'Carrot'].each do |sp|
  species = sp.downcase
  require_relative "../../orgs/#{species}/#{species}_parms"
  eval <<~DYNAMIC
    class #{sp}FertilityTest < Minitest::Test
      def test_#{species}_birth_probability_returns_a_result_between_0_and_1
        age = 4
        color = 'test_color1'
        assert_includes 0..1, #{sp}.birth_probability(age: age, color: color)
      end

      def test_#{species}_birth_probability_converts_a_result_gt_1_to_1
        # TODO: fix dependence on actual age and color adj return values
        age = 3
        color = 'test_color2'
        assert_equal 1.00, #{sp}.birth_probability(age: age, color: color)
      end

      def test_#{species}_birth_probability_ignores_a_non_#{species}_color
        age = 3
        color = 'Truck'
        assert_equal 0, #{sp}.birth_probability(age: age, color: color)
      end

      def test_#{species}_birth_probability_ignores_an_empty_color
        age = 4
        color = ''
        assert_equal 0, #{sp}.birth_probability(age: age, color: color)
      end
    end
  DYNAMIC
end