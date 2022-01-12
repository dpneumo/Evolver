# frozen_string_literal: true

class Utilities::Critters::Coyote::TestColor
  attr_reader :name, :mutations

  def initialize
    @name      = 'test_color'
    @mutations = { test_color: 1.00,
                   black:      0.00,
                   brown:      0.00,
                   gray:       0.00,
                   white:      0.00 }
  end
end
