# frozen_string_literal: true

require_relative '../utilities/colors'
require_relative 'test_helper'

class ColorsTest < Minitest::Test
  def test_colors_returns_a_hash
    assert_equal Hash, Colors.colors.class
  end

  def test_colors_keys_are_integers
    assert(Colors.colors.keys.all? { |k| k.is_a? Integer })
  end

  def test_colors_values_are_strings
    assert(Colors.colors.values.all? { |v| v.is_a? String })
  end

  def test_mutations_returns_a_hash
    assert_equal Hash, Colors.mutations.class
  end

  def test_mutations_keys_are_integers
    assert(Colors.mutations.keys.all? { |k| k.is_a? Integer })
  end

  def test_mutations_values_are_hashes
    assert(Colors.mutations.values.all? { |v| v.is_a? Hash })
  end

  def test_a_color_mutation_probabilities_sum_to_1
    Colors.mutations.each_value do |probabilities|
      assert_equal 1.00, probabilities.values.sum
    end
  end
end
