# frozen_string_literal: true

class Utilities::Critters::Coyote::Black
  attr_reader :name, :mutations

  def initialize
    @name      = 'black'
    @mutations = { test_color: 0.00,
                   black:      0.70,
                   brown:      0.20,
                   gray:       0.05,
                   white:      0.05 }
  end
end
