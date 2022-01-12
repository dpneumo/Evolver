# frozen_string_literal: true
require_relative '../../utilities'

class Utilities::Critters::Coyote::White
  attr_reader :name, :mutations

  def initialize
    @name      = 'white'
    @mutations = { test_color: 0.00,
                   black:      0.10,
                   brown:      0.05,
                   gray:       0.05,
                   white:      0.80 }
  end
end
