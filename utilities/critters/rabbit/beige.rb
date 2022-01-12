# frozen_string_literal: true
require_relative '../../utilities'

class Utilities::Critters::Rabbit::Beige
  attr_reader :name, :mutations

  def initialize
    @name      = 'beige'
    @mutations = { test_color: 0.00,
                   beige:      0.70,
                   black:      0.20,
                   chocolate:  0.05,
                   white:      0.05 }
  end
end
