# frozen_string_literal: true

class Orgbase
  attr_reader :age, :health, :vigor, :satiety, :species, :color

  def initialize(color: 'red')
    @age        = 0
    @health     = 1.0
    @vigor      = 1.0
    @satiety    = 1.0
    @species = 'orgbase'
    @color = color
  end

  def age=(age)
    raise "age must be an Integer" unless age.is_a? Integer
    @age = age.clamp(0..)
  end

  def health=(health)
    raise "health must be a Numeric" unless health.is_a? Numeric
    @health = health.clamp(0.0..1.0)
  end

  def vigor=(vigor)
    raise "vigor must be a Numeric" unless vigor.is_a? Numeric
    @vigor = vigor.clamp(0.0..1.0)
  end

  def satiety=(satiety)
    raise "satiety must be a Numeric" unless satiety.is_a? Numeric
    @satiety = satiety.clamp(0.0..1.0)
  end
end
