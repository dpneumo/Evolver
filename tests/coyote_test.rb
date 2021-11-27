# frozen_string_literal: true

require_relative '../utilities/toolbox'
require_relative '../models/coyote'
require_relative 'test_helper'

class CoyoteTest < Minitest::Test
  def setup
    toolbox = Toolbox.new
    @coyote = Coyote.new(toolbox: toolbox)
  end

  def test_new_requires_a_toolbox_argument
    assert_raises ArgumentError do
      Coyote.new
    end
  end

  def test_coyote_defaults
    assert_equal 0,     @coyote.age
    assert_equal 1.0,   @coyote.health
    assert_equal 1,     @coyote.color_id
    assert_equal "red", @coyote.color_name
  end

  def test_coyote_age_is_publicly_accessible
    @coyote.age = 3
    assert_equal 3, @coyote.age
  end

  def test_coyote_health_is_publicly_accessible
    @coyote.health = 0.5
    assert_equal 0.5, @coyote.health
  end

  def test_age_must_not_be_lt_0
    @coyote.age = -2
    assert_equal 0, @coyote.age
  end

  def test_age_must_be_an_integer
    assert_raises { @coyote.age = 3.5 }
  end

  def test_health_must_not_be_lt_0
    @coyote.health = -2
    assert_equal 0.0, @coyote.health
  end

  def test_health_must_not_be_gt_1
    @coyote.health = 2
    assert_equal 1.0, @coyote.health
  end

  def test_health_must_be_an_number
    assert_raises { @coyote.health = 'good' }
  end
end
