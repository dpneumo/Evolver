# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/rabbit'

class RabbitTest < Minitest::Test
  def setup
    toolbox = Toolbox.new
    @rabbit = Rabbit.new(toolbox: toolbox)
  end


  def test_rabbit_defaults
    assert_equal 'rabbit', @rabbit.species
    #assert_equal 1,  @rabbit.color_id
  end
end
