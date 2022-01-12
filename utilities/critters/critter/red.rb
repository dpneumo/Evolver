# frozen_string_literal: true

class Utilities::Critters::Critter::Red
  attr_reader :name, :mutations

  def initialize
    @name      = 'red'
    @mutations = { test_color: 0.00,
                   red:        0.70,
                   green:      0.20,
                   blue:       0.05,
                   yellow:     0.05 }
  end
end
