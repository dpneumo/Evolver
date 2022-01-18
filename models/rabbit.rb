# frozen_string_literal: true

require_relative 'orgbase'
require_relative '../utilities/utilities'
require_relative '../utilities/critters/rabbit/rabbit_colors'
require_relative '../utilities/critters/rabbit/rabbit_fertility'

class Rabbit < Orgbase
  extend RabbitColors
  extend RabbitFertility
  def initialize(toolbox:, color: 'black')
    super(toolbox: toolbox, color: color)
    @species = 'rabbit'
    @color   = color
  end
end
