# frozen_string_literal: true

class Utilities::Critters::Critter::Yellow
  attr_reader :name, :mutations

  def initialize
    @name      = 'yellow'
    @mutations = { test_color: 0.00,
                   red:        0.05,
                   green:      0.05,
                   blue:       0.30,
                   yellow:     0.60 }
  end
end
