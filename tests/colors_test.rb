# frozen_string_literal: true

require_relative '../utilities/colors'
require_relative 'test_helper'

class ColorsTest < Minitest::Test
  def setup
    @clrs = Colors.new
  end

  def test_colors_returns_a_hash
    assert_equal Hash, @clrs.colors.class
  end

  def test_colors_keys_are_integers
    assert(@clrs.colors.keys.all? { |k| k.is_a? Integer })
  end

  def test_colors_values_are_strings
    assert(@clrs.colors.values.all? { |v| v.is_a? String })
  end

  def test_mutations_returns_a_hash
    assert_equal Hash, @clrs.mutations.class
  end

  def test_mutations_keys_are_integers
    assert(@clrs.mutations.keys.all? { |k| k.is_a? Integer })
  end

  def test_mutations_values_are_hashes
    assert(@clrs.mutations.values.all? { |v| v.is_a? Hash })
  end

  def test_a_color_mutation_probabilities_sum_to_1
    @clrs.mutations.each_value do |probabilities|
      assert_equal 1.00, probabilities.values.sum
    end
  end
end
