# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/creatures_interface_test'
require_relative '../mocks'

class MockCreaturesTest < Minitest::Test
  include CreaturesInterfaceTest
  def setup
    foodchain = { }
    @crturs = @object = MockCreatures.new(foodchain: foodchain)
  end
end
