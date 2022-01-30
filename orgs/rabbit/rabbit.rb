# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'rabbit_colors'
require_relative 'rabbit_fertility'
require_relative 'rabbit_vitality'

class Rabbit < Orgbase
  extend RabbitColors
  extend RabbitFertility
  extend RabbitVitality
  def initialize(color: 'black')
    super(color: color)
    @species = 'rabbit'
  end
end
