# frozen_string_literal: true

require_relative '../utilities/utilities'
require_relative '../utilities/critters/critter/critter_colors'
require_relative '../utilities/critters/critter/critter_fertility'

class Critter
  extend CritterColors
  extend CritterFertility
  attr_reader :age, :health, :species, :color

  def initialize(toolbox:, color: 'red')
    @age        = 0
    @health     = 1.0
    @species = 'critter'
    @color = 'red'
  end

  def age=(age)
    raise "age must be an Integer" unless age.is_a? Integer
    @age = age.clamp(0..)
  end

  def health=(health)
    raise "health must be a Numeric" unless health.is_a? Numeric
    @health = health.clamp(0.0..1.0)
  end
end
