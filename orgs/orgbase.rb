# frozen_string_literal: true

require_relative 'orgbase_encounters'

class Orgbase
  include UtilityMethods
  extend OrgbaseEncounters

  class << self
    def age_curve
      @age_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:10).round(4) }
    end

    def health_curve
      @health_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }
    end

    def vigor_curve
      @vigor_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }
    end
  end

  def self.species; 'orgbase'; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end

  def self.birth_probability(age:, color:)
    return 0.00 unless (age.is_a? Integer) && age >= 0
    return 0.00 unless color.is_a? String

    adjusted_fertility(age, color).clamp(0.0, 1.0)
  end

  def self.survival_probability(age:, color:)
    return 0.00 unless (age.is_a? Integer) && age >= 0
    return 0.00 unless color.is_a? String

    adjusted_vitality(age, color).clamp(0.0, 1.0)
  end


  #Instance
  attr_reader :species, :satiety, 
              :color, :age, :health, :vigor
  def initialize(color: 'red')
    @species  = self.class.species
    @satiety  = self.class.satiety
    @color    = color
    @age      = 0
    @health   = 100
    @vigor    = 100
    nil
  end

  def age=(age)
    raise ArgumentError, "age must be an Integer" unless age.is_a? Integer
    @age = age.clamp(0..)
  end

  def health=(health)
    raise ArgumentError, "health must be an Integer" unless health.is_a? Integer
    @health = health.clamp(0..self.class.max_health)
  end

  def vigor=(vigor)
    raise ArgumentError, "vigor must be an Integer" unless vigor.is_a? Integer
    @vigor = vigor.clamp(0..self.class.max_vigor)
  end

  def eats_prob
    eat_by_age * eat_by_health * eat_by_vigor
  end

  def eaten_vulnerability
    eaten_vulnerability_by_age * eaten_vulnerability_by_health * eaten_vulnerability_by_vigor
  end

  private
  # Fertility
    def self.adjusted_fertility(age, color)
      fertility_by_age[age] * fertility_color_adjust[color]
    end

  # Vitality
    def self.adjusted_vitality(age, color)
      survive_by_age[age] * survival_color_adjust[color]
    end

  # Feeding
    # As hunter
    def eat_by_age
      1.0 - self.class.age_curve[age]
    end

    def eat_by_health
      self.class.health_curve[health]
    end

    def eat_by_vigor
      self.class.vigor_curve[vigor]
    end

    # As prey
    def eaten_vulnerability_by_age
      self.class.age_curve[age]
    end

    def eaten_vulnerability_by_health
      1.0 - self.class.health_curve[health]
    end

    def eaten_vulnerability_by_vigor
      1.0 - self.class.vigor_curve[vigor]
    end
end
