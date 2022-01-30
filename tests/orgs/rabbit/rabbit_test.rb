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
  end
end
