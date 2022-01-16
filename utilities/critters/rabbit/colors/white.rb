# frozen_string_literal: true

class Utilities::Critters::Rabbit::RabbitColors::White
  attr_reader :name, :mutations
  def initialize
    @name      = 'white'
    @mutations = {
      'test_color' => 0.00,
      'beige' =>      0.15,
      'black' =>      0.30,
      'chocolate' =>  0.05,
      'white' =>      0.50,
    }
  end
end
