# frozen_string_literal: true

class Utilities::Critters::Critter::Blue
  attr_reader :name, :mutations

  def initialize
    @name      = 'blue'
    @mutations = { test_color: 0.00,
                   red:        0.15,
                   green:      0.30,
                   blue:       0.50,
                   yellow:     0.05 }
  end
end
