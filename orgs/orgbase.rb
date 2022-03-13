# frozen_string_literal: true

require_relative 'orgbase_encounters'

class Orgbase
  extend UtilityMethods

  AgeLogistic =      Hash.new {|h,key| h[key] = logistic(x: 2*key, k:1.0, x0:0).round(4) }
  HealthLogistic =   Hash.new {|h,key| h[key] = logistic(x: 2*key, k:1.0, x0:0).round(4) }
  VigorLogistic =    Hash.new {|h,key| h[key] = logistic(x: 2*key, k:1.0, x0:0).round(4) }

  def self.species; 'orgbase'; end
  def self.satiety; 20; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 5; end

  attr_reader :age, :health, :vigor, :species, :color
  def initialize(color: 'red')
    @age      = 0
    @health   = 100
    @vigor    = 100
    @color    = color
    @species  = self.class.species
    nil
  end

  def age=(age)
    raise "age must be an Integer" unless age.is_a? Integer
    @age = age.clamp(0..)
  end

  def health=(health)
    raise "health must be an Integer" unless health.is_a? Integer
    @health = health.clamp(0..self.class.max_health)
  end

  def vigor=(vigor)
    raise "vigor must be an Integer" unless vigor.is_a? Integer
    @vigor = vigor.clamp(0..self.class.max_vigor)
  end

  def encounter_count(ratio:, health:)
    adjusted_encounter_count(ratio, health).clamp(0, self.class.satiety)
  end


  def eats_prob
    eat_by_age * eat_by_health * eat_by_vigor
  end

  def eaten_prob
    eaten_by_age * eaten_by_health * eaten_by_vigor
  end

  private
    # As hunter
    def eat_by_age
      raise "eat_by_age not implemented in Orgbase"
    end

    def eat_by_health
      raise "eat_by_health not implemented in Orgbase"
    end

    def eat_by_vigor
      raise "eat_by_vigor not implemented in Orgbase"
    end

    # As prey
    def eaten_by_age
      raise "eaten_by_age not implemented in Orgbase"
    end

    def eaten_by_health
      raise "eaten_by_health not implemented in Orgbase"
    end

    def eaten_by_vigor
      raise "eaten_by_vigor not implemented in Orgbase"
    end
end
