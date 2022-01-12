# frozen_string_literal: true
require_relative '../../utilities'

class Utilities::Critters::Rabbit::Black
  attr_reader :name, :mutations

  def initialize
    @name      = 'black'
    @mutations = { test_color: 0.00,
                   beige:      0.10,
                   black:      0.80,
                   chocolate:  0.05,
                   white:      0.05 }
  end
end
