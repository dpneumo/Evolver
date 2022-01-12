# frozen_string_literal: true
require_relative '../../utilities'

class Utilities::Critters::Coyote::Gray
  attr_reader :name, :mutations

  def initialize
    @name      = 'gray'
    @mutations = { test_color: 0.00,
                   black:      0.15,
                   brown:      0.30,
                   gray:       0.50,
                   white:      0.05 }
  end
end
