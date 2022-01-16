# frozen_string_literal: true

require_relative 'colors/blue'
require_relative 'colors/green'
require_relative 'colors/red'
require_relative 'colors/yellow'
require_relative 'colors/test_color'

module CritterColors
  def colors
    {
      'blue' => Utilities::Critters::Critter::CritterColors::Blue.new,
      'green' => Utilities::Critters::Critter::CritterColors::Green.new,
      'red' => Utilities::Critters::Critter::CritterColors::Red.new,
      'yellow' => Utilities::Critters::Critter::CritterColors::Yellow.new,
      'test_color' => Utilities::Critters::Critter::CritterColors::TestColor.new,
    }
  end
end
