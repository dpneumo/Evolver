# frozen_string_literal: true

require_relative '../test_helper'

class UtilityMethodsTest < Minitest::Test
  include UtilityMethods

  def test_flip
    Random.stub :rand, 0.4 do
      assert flip(biased_coin: 0.5)
      refute flip(biased_coin: 0.4)
      refute flip(biased_coin: 0.2)
    end
  end

  def test_roll
    Random.stub :rand, 0.4 do
      threesided_1 = {1 => 0.6, 2 => 0.3, 3 => 0.1}
      threesided_3 = {1 => 0.2, 2 => 0.3, 3 => 0.5}
      assert_equal 3, roll(loaded_die: threesided_3)
      assert_equal 1, roll(loaded_die: threesided_1)
    end
  end

  def test_random_ndxs
    Random.stub :rand, 4 do
      collection = %w[ a b c d e f g h i j k l m ]
      ndx_count = 3
      assert_equal [4,4,4], random_ndxs(collection, ndx_count)
    end
  end

  def test_mean_returns_0_for_count_0
    result = mean(count: 0, sum: 10)
    refute result.is_a?(Integer), "Result is an integer"
    assert result.is_a?(Numeric)
    assert_equal 0.0, mean(count: 0, sum: 10)
  end

  def test_mean_returns_mean_of_count_values
    assert_equal 2.5, mean(count: 4, sum: 10)
  end

  def test_constantize_returns_a_constant_with_the_given_string_as_name 
    const = constantize('my_class')
    assert_equal MyClass, const 
  end

  def test_a_noisy_method_output_is_silenced
    assert_output(nil,nil) do 
      rslt = silence_streams(STDERR, STDOUT) { NoisyClass.new.be_loud }
      assert_equal 'Is that loud enough?', rslt
    end
  end

  def test_log2curve_for_x_eq_1_returns_0
    result = self.class.log2curve(x:1)
    refute result.is_a?(Integer)
    assert result.is_a?(Numeric)
    assert_equal 0.0, result
  end

  def test_log2curve_scaled_returns_a_Numeric
    assert_in_delta 6.262, self.class.log2curve(x:4.25, scale:3.0), 0.0005
  end

  def test_sinecurve_for_x_eq_0_returns_0
    result = self.class.sinecurve(x:0)
    refute result.is_a? Integer
    assert result.is_a? Numeric
    assert_equal 0.0, result
  end

  def test_sinecurve_for_x_eq_half_PI_and_scale_eq_3_returns_3
    assert_equal 3.0, self.class.sinecurve(x:Math::PI/2, scale:3)
  end

  def donot_test_descendants
    assert_equal [B,A,D], C.descendants
  end
end

class NoisyClass
  def be_loud
    puts "A VERY NOISY METHOD!!!"
    'Is that loud enough?'
  end
end
class MyClass;end
class C; include UtilityMethods; end
class B < C; end
class A < B; end
class D < C; end
