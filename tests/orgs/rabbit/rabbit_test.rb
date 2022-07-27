# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/orgbase'
require_relative '../../../orgs/rabbit/rabbit'

class RabbitTest < Minitest::Test
  def setup
    @rabbit = Rabbit.new
  end

  def test_rabbit_defaults
    assert_equal 'rabbit', @rabbit.species
    assert_equal 'black', @rabbit.color
  end

  def test_can_set_color_in_instance_initialization
    @rabbit_con_color = Rabbit.new(color: 'mauve')
    assert_equal 'mauve', @rabbit_con_color.color
  end
end
