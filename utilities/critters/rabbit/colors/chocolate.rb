# frozen_string_literal: true

class Utilities::Critters::Rabbit::RabbitColors::Chocolate
  attr_reader :name, :mutations
  def initialize
    @name      = 'chocolate'
    @mutations = {
      'test_color' => 0.00,
      'beige' =>      0.05,
      'black' =>      0.05,
      'chocolate' =>  0.60,
      'white' =>      0.30,
    }
  end
end
