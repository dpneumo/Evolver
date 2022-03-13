# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/orgbase'
require_relative '../../../orgs/critter/critter'

class CritterTest < Minitest::Test
  def setup
    @critter = Critter.new
  end

  def test_critter_defaults
    assert_equal 'critter', @critter.species
  end
end
