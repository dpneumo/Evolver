# frozen_string_literal: true

require_relative 'orgbase_encounters'

class Orgbase
  extend UtilityMethods

  def self.species; 'orgbase'; end
  def self.satiety; 20; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 5; end

  def self.birth_probability(age:, color:)
    return 0.00 unless (valid?(age) && valid?(color))

    adjusted_fertility(age, color).clamp(0.0, 1.0)
  end

  def self.survival_probability(age:, color:)
    return 1.00 unless valid?(age) && valid?(color)

    adjusted_vitality(age, color).clamp(0.0, 1.0)
  end

  #Instance
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
  # Validation
    def self.valid?(parm)
       (parm.is_a? String) || ((parm.is_a? Integer) && parm >= 0)
    end

  # Fertility
    def self.adjusted_fertility(age, color)
      fertility_by_age(age) * fertility_color_adjust(color)
    end

    def self.fertility_by_age(age)
      raise "fertility_by_age not implemented in OrgbaseFertility"
    end

    def self.fertility_color_adjust(color)
      raise "fertility_color_adjust not implemented in OrgbaseFertility"
    end

  # Vitality
    def self.adjusted_vitality(age, color)
      survive_by_age(age) * survival_color_adjust(color)
    end

    def self.survive_by_age(age)
      raise "survive_by_age not implemented in OrgbaseVitality"
    end

    def self.survival_color_adjust(color)
      raise "survival_color_adjust not implemented in OrgbaseFertility"
    end

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
