# frozen_string_literal: true

require_relative 'colors/beige'
require_relative 'colors/black'
require_relative 'colors/chocolate'
require_relative 'colors/white'
require_relative 'colors/test_color'

module RabbitColors
  def colors
    {
      'beige' =>     Utilities::Critters::Rabbit::RabbitColors::Beige.new,
      'black' =>     Utilities::Critters::Rabbit::RabbitColors::Black.new,
      'chocolate' => Utilities::Critters::Rabbit::RabbitColors::Chocolate.new,
      'white' =>     Utilities::Critters::Rabbit::RabbitColors::White.new,
      'test_color' => Utilities::Critters::Rabbit::RabbitColors::TestColor.new,
    }
  end
end
