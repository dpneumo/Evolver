# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../../support/id_generator'

class IDGeneratorTest < Minitest::Test
  def test_first_id_is_1
    idgen = IDGenerator.new
    assert_equal 1, idgen.next
  end

  def test_each_id_is_1_more_than_the_last
    idgen = IDGenerator.new
    10.times do |n|
      assert_equal n + 1, idgen.next
    end
  end
end
