# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../test/interfaces/orgbase_interface_test'
require_relative '../../orgs/orgbase'

class OrgbaseTest < Minitest::Test
  include OrgbaseInterfaceTest
  def setup
    @org = @object = Orgbase.new
  end

# Class tests
  def test_Orgbase_class_defaults_are_set
    assert Orgbase.species
    assert Orgbase.satiety
    assert Orgbase.max_health
    assert Orgbase.max_vigor
    assert Orgbase.enctr_scale
  end

# Instance tests
  def test_orgbase_instance_defaults_are_set
    assert @org.species
    assert @org.satiety
    assert @org.age
    assert @org.health
    assert @org.vigor
    assert @org.color
  end

  def test_can_set_color_in_instance_initialization
    @org_con_color = Orgbase.new(color: 'purple')
    assert_equal 'purple', @org_con_color.color
  end

  def test_orgbase_age_accepts_an_integer_value
    @org.age = 3
    assert_equal 3, @org.age
  end

  def test_orgbase_age_raises_on_noninteger_value
    assert_raises ArgumentError do
      @org.age = 3.5
    end
    assert_raises ArgumentError do
      @org.age = 'A string'
    end
  end

  def test_negative_age_is_forced_to_0
    @org.age = -2
    assert_equal 0, @org.age
  end

  def test_orgbase_health_accepts_an_integer_value
    @org.health = 3
    assert_equal 3, @org.health
  end

  def test_orgbase_health_raises_on_noninteger_value
    assert_raises ArgumentError do
      @org.health = 'three'
    end
    assert_raises ArgumentError do
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

  def test_orgbase_vigor_accepts_an_integer_value
    @org.vigor = 3
    assert_equal 3, @org.vigor
  end

  def test_orgbase_vigor_raises_on_noninteger_value
    assert_raises ArgumentError do
      @org.vigor = 'three'
    end
    assert_raises ArgumentError do
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

  def test_a_new_org_eats_prob_is_close_to_1
    assert_in_delta 1.0, @org.eats_prob, 0.1
  end

  def test_a_1_yo_org_with_vigor_and_health_50_has_eaten_vulnerability_near_0
    @org.age = 1
    @org.health = @org.vigor = 50
    assert_in_delta 0.0, @org.eaten_vulnerability, 0.1
  end
end
