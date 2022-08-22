# frozen_string_literal: true

require_relative 'orgbase_encounters'

class Orgbase
  extend UtilityMethods

  def self.species; 'orgbase'; end
  def self.satiety; 20; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 5.0; end

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
  attr_reader :age, :health, :vigor, :species, :color
  def initialize(color: 'red')
    @species  = self.class.species
    @age      = 0
    @health   = 100
    @vigor    = 100
    @color    = color
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

  def encounter_count(ratio:, health:)
    adjusted_encounter_count(ratio, health).clamp(0, self.class.satiety)
  end


  def eats_prob
    eat_by_age * eat_by_health * eat_by_vigor
  end

  def eaten_vulnerability
    eaten_vulnerability_by_age * eaten_vulnerability_by_health * eaten_vulnerability_by_vigor
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
      raise NotImplementedError, "fertility_by_age not implemented in OrgbaseFertility"
    end

    def self.fertility_color_adjust(color)
      raise NotImplementedError, "fertility_color_adjust not implemented in OrgbaseFertility"
    end

  # Vitality
    def self.adjusted_vitality(age, color)
      survive_by_age(age) * survival_color_adjust(color)
    end

    def self.survive_by_age(age)
      raise NotImplementedError, "survive_by_age not implemented in OrgbaseVitality"
    end

    def self.survival_color_adjust(color)
      raise NotImplementedError, "survival_color_adjust not implemented in OrgbaseFertility"
    end

    # As hunter
    def eat_by_age
      raise NotImplementedError, "eat_by_age not implemented in Orgbase"
    end

    def eat_by_health
      raise NotImplementedError, "eat_by_health not implemented in Orgbase"
    end

    def eat_by_vigor
      raise NotImplementedError, "eat_by_vigor not implemented in Orgbase"
    end

    # As prey
    def eaten_vulnerability_by_age
      raise NotImplementedError, "eaten_by_age not implemented in Orgbase"
    end

    def eaten_vulnerability_by_health
      raise NotImplementedError, "eaten_by_health not implemented in Orgbase"
    end

    def eaten_vulnerability_by_vigor
      raise NotImplementedError, "eaten_by_vigor not implemented in Orgbase"
    end
end
