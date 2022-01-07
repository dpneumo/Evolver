# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/critter'

class CritterTest < Minitest::Test
  def setup
    @toolbox = Toolbox.new
    @critter = Critter.new(toolbox: @toolbox)
  end

  def test_new_requires_a_toolbox_argument
    assert_raises ArgumentError do
      Critter.new
    end
  end

  def test_critter_defaults
    assert_equal 0, @critter.age
    assert_equal 1.0, @critter.health
    assert_equal 1, @critter.color_id
    assert_equal 'critter', @critter.species_name
  end

  def test_critter_age_is_publicly_writable
    @critter.age = 2
    assert_equal 2, @critter.age
  end

  def test_critter_age_must_be_an_integer
    assert_raises RuntimeError do
      @critter.age = 3.5
    end
  end

  def test_negative_age_is_forced_to_0
    @critter.age = -2
    assert_equal 0, @critter.age
  end

  def test_critter_health_is_publicly_writable
    @critter.health = 0.5
    assert_equal 0.5, @critter.health
  end

  def test_critter_health_must_be_a_numeric
    assert_raises RuntimeError do
      @critter.health = 'three'
    end
  end

  def test_negative_health_is_forced_to_0
    @critter.health = -2
    assert_equal 0.0, @critter.health
  end

  def test_health_gt_1_is_forced_to_1
    @critter.health = 2
    assert_equal 1.0, @critter.health
  end

end
