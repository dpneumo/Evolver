# frozen_string_literal: true

class Critter
  attr_reader :age, :health, :color_id, :species

  def initialize(toolbox:, color_id: 1)
    @age        = 0
    @health     = 1.0
    @color_id   = color_id
    @species = 'critter'
    @colors = toolbox.colors
  end

  def age=(age)
    raise "age must be an Integer" unless age.is_a? Integer
    @age = age.clamp(0..)
  end

  def health=(health)
    raise "health must be a number" unless health.is_a? Numeric
    @health = health.clamp(0.0..1.0)
  end

  def color_id=(color_id)
    raise "color_id must be an Integer" unless color_id.is_a? Integer
    @color_id = color_id.clamp(0..)
  end

  def color_name
    @colors.color_names[@color_id]
  end
end
