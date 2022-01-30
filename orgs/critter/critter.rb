# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'critter_colors'
require_relative 'critter_fertility'
require_relative 'critter_vitality'

class Critter < Orgbase
  extend CritterColors
  extend CritterFertility
  extend CritterVitality
  def initialize(color: 'red')
    super(color: color)
    @species = 'critter'
  end
end
