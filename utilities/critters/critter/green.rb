# frozen_string_literal: true

class Utilities::Critters::Critter::Green
  attr_reader :name, :mutations

  def initialize
    @name      = 'green'
    @mutations = { test_color: 0.00,
                   red:        0.10,
                   green:      0.80,
                   blue:       0.05,
                   yellow:     0.05 }
  end
end
