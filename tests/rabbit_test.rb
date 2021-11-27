# frozen_string_literal: true

require_relative '../utilities/toolbox'
require_relative '../models/rabbit'
require_relative 'test_helper'

class RabbitTest < Minitest::Test
  def setup
    toolbox = Toolbox.new
    @rabbit = Rabbit.new(toolbox: toolbox)
  end

  def test_new_requires_a_toolbox_argument
    assert_raises ArgumentError do
      Rabbit.new
    end
  end

  def test_rabbit_defaults
    assert_equal 0,     @rabbit.age
    assert_equal 1.0,   @rabbit.health
    assert_equal 1,     @rabbit.color_id
    assert_equal "red", @rabbit.color_name
  end

  def test_rabbit_age_is_publicly_accessible
    @rabbit.age = 3
    assert_equal 3, @rabbit.age
  end

  def test_rabbit_health_is_publicly_accessible
    @rabbit.health = 0.5
    assert_equal 0.5, @rabbit.health
  end

  def test_age_must_not_be_lt_0
    @rabbit.age = -2
    assert_equal 0, @rabbit.age
  end

  def test_age_must_be_an_integer
    assert_raises { @rabbit.age = 3.5 }
  end

  def test_health_must_not_be_lt_0
    @rabbit.health = -2
    assert_equal 0.0, @rabbit.health
  end

  def test_health_must_not_be_gt_1
    @rabbit.health = 2
    assert_equal 1.0, @rabbit.health
  end

  def test_health_must_be_an_number
    assert_raises { @rabbit.health = 'good' }
  end
end
