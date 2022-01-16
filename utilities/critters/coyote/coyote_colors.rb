# frozen_string_literal: true

require_relative 'colors/black'
require_relative 'colors/brown'
require_relative 'colors/gray'
require_relative 'colors/white'
require_relative 'colors/test_color'

module CoyoteColors
  def colors
    {
      'black' => Utilities::Critters::Coyote::CoyoteColors::Black.new,
      'brown' => Utilities::Critters::Coyote::CoyoteColors::Brown.new,
      'gray' =>  Utilities::Critters::Coyote::CoyoteColors::Gray.new,
      'white' => Utilities::Critters::Coyote::CoyoteColors::White.new,
      'test_color' => Utilities::Critters::Coyote::CoyoteColors::TestColor.new,
    }
  end
end
