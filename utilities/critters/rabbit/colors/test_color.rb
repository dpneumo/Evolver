# frozen_string_literal: true

class Utilities::Critters::Rabbit::RabbitColors::TestColor
  attr_reader :name, :mutations
  def initialize
    @name      = 'test_color'
    @mutations = {
      'test_color' => 1.00,
      'beige' =>      0.00,
      'black' =>      0.00,
      'chocolate' =>  0.00,
      'white' =>      0.00,
    }
  end
end
