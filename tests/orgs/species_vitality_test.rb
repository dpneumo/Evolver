# frozen_string_literal: true

require_relative '../test_helper'

['Critter', 'Coyote', 'Rabbit', 'Carrot'].each do |sp|
  species = sp.downcase
  require_relative "../../orgs/#{species}/#{species}_vitality"
  eval <<~DYNAMIC
    class #{sp}VitalityTest < Minitest::Test
      def test_#{species}_survival_probability_returns_a_result_between_0_and_1
        age = 4
        color = 'test_color1'
        assert_includes 0.0..1.0, #{sp}.survival_probability(age: age, color: color)
      end

      def test_#{species}_survival_probability_converts_a_result_gt_1_to_1
        # TODO: fix dependence on actual age and color adj return values
        age = 1
        color = 'test_color2'
        assert_equal 1.0, #{sp}.survival_probability(age: age, color: color)
      end

      def test_#{species}_survival_probability_returns_0_for_a_non_#{species}_color
        age = 1
        color = 'Zebra'
        assert_equal 0.0, #{sp}.survival_probability(age: age, color: color)
      end

      def test_#{species}_survival_probability_returns_0_for_an_empty_color
        age = 1
        color = ''
        assert_equal 0.0, #{sp}.survival_probability(age: age, color: color)
      end
    end
  DYNAMIC
end