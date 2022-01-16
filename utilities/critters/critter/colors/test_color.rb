# frozen_string_literal: true

class Utilities::Critters::Critter::CritterColors::TestColor
  attr_reader :name, :mutations
  def initialize
    @name      = 'test_color'
    @mutations = {
      'test_color' => 1.00,
      'red' =>        0.00,
      'green' =>      0.00,
      'blue' =>       0.00,
      'yellow' =>     0.00,
    }
  end
end
