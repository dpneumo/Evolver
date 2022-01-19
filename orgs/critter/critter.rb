# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'critter_colors'
require_relative 'critter_fertility'

class Critter < Orgbase
  extend CritterColors
  extend CritterFertility
  def initialize(toolbox:, color: 'red')
    super(toolbox: toolbox, color: color)
    @species = 'critter'
    @color = color
  end
end
