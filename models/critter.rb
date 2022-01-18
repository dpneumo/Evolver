# frozen_string_literal: true

require_relative 'orgbase'
require_relative '../utilities/utilities'
require_relative '../utilities/critters/critter/critter_colors'
require_relative '../utilities/critters/critter/critter_fertility'

class Critter < Orgbase
  extend CritterColors
  extend CritterFertility
  def initialize(toolbox:, color: 'red')
    super(toolbox: toolbox, color: color)
    @species = 'critter'
    @color = color
  end
end
