# frozen_string_literal: true

class Utilities::Critters::Coyote::CoyoteColors::Brown
  attr_reader :name, :mutations
  def initialize
    @name      = 'brown'
    @mutations = {
      'test_color' => 0.00,
      'black' =>      0.05,
      'brown' =>      0.60,
      'gray' =>       0.30,
      'white' =>      0.05,
      }
  end
end
