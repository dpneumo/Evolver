# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/orgbase'

class OrgbaseTest < Minitest::Test
  def setup
    @org = Orgbase.new
  end

  def test_orgbase_defaults
    assert_equal 0, @org.age
    assert_equal 100, @org.health
    assert_equal 100, @org.vigor
    assert_equal 'orgbase', @org.species
    assert_equal 'red', @org.color
  end

  def test_orgbase_age_is_publicly_writable
    @org.age = 2
    assert_equal 2, @org.age
  end

  def test_orgbase_age_must_be_an_integer
    assert_raises RuntimeError do
      @org.age = 3.5
    end
  end

  def test_negative_age_is_forced_to_0
    @org.age = -2
    assert_equal 0, @org.age
  end

  def test_orgbase_health_is_publicly_writable
    @org.health = 3
    assert_equal 3, @org.health
  end

  def test_orgbase_health_must_be_an_integer
    assert_raises RuntimeError do
      @org.health = 'three'
    end
    assert_raises RuntimeError do
      @org.health = 3.0
    end
  end

  def test_negative_health_is_forced_to_0
    @org.health = -2
    assert_equal 0, @org.health
  end

  def test_health_gt_max_health_is_forced_to_max_health
    @org.health = @org.class.max_health + 1
    assert_equal @org.class.max_health, @org.health
  end

  def test_orgbase_vigor_is_publicly_writable
    @org.vigor = 3
    assert_equal 3, @org.vigor
  end

  def test_orgbase_vigor_must_be_an_integer
    assert_raises RuntimeError do
      @org.vigor = 'three'
    end
    assert_raises RuntimeError do
      @org.vigor = 3.0
    end
  end

  def test_negative_vigor_is_forced_to_0
    @org.vigor = -2
    assert_equal 0, @org.vigor
  end

  def test_vigor_gt_max_vigor_is_forced_to_max_vigor
    @org.vigor = @org.class.max_vigor + 1
    assert_equal @org.class.max_vigor, @org.vigor
  end
end
