# frozen_string_literal: true

class Coyote
  attr_reader :age, :health, :color_id, :color_name

  def initialize(toolbox:)
    @age        = 0
    @health     = 1.0
    @color_id   = 1
    @color_name = toolbox.colors.color_names[@color_id]
  end

  def age=(age)
    raise "coyote.age must be an Integer" unless age.is_a? Integer
    @age = age.clamp(0..)
  end

  def health=(health)
    raise "coyote.health must be a number" unless health.is_a? Numeric
    @health = health.clamp(0.0..1.0)
  end
end
