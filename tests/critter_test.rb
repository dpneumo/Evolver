# frozen_string_literal: true

require_relative '../utilities/toolbox'
require_relative '../models/critter'
require_relative 'test_helper'

class CritterTest < Minitest::Test
  def setup
    @toolbox = Toolbox.new
  end

  def test_new_requires_a_toolbox_argument
    assert_raises ArgumentError do
      Critter.new
    end
  end

  def test_critter_defaults
    critter = Critter.new(toolbox: @toolbox)
    assert_equal 0, critter.parent_id
    assert_equal 1, critter.color_id
    assert_equal 0, critter.age
    assert_equal Array, critter.children_ids.class
    assert critter.children_ids.empty?
    assert critter.id.is_a? Integer
  end

  def test_critter_accepts_a_parent_id_argument
    critter = Critter.new(toolbox: @toolbox, parent_id: 4)
    assert_equal 4, critter.parent_id
  end

  def test_critter_accepts_a_color_id_argument
    critter = Critter.new(toolbox: @toolbox, color_id: 4)
    assert_equal 4, critter.color_id
  end

  def test_critter_accepts_an_age_argument
    critter = Critter.new(toolbox: @toolbox, age: 4)
    assert_equal 4, critter.age
  end

  def test_critter_accepts_a_children_ids_argument
    critter = Critter.new(toolbox: @toolbox, children_ids: [3,4])
    assert_equal [3,4], critter.children_ids
  end
end
