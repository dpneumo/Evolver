# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'critter_colors'
require_relative 'critter_fertility'
require_relative 'critter_vitality'

class Critter < Orgbase
  extend CritterColors
  extend CritterFertility
  extend CritterVitality

  AgeLogistic =      Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:5).round(4) }
  HealthLogistic =   Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.10, x0:50).round(4) }
  VigorLogistic =    Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.05, x0:50).round(4) }

  def self.species; 'critter'; end
  def self.satiety; 20; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 5; end

  def initialize(color: 'red')
    super(color: color)
    nil
  end

  private
    # As hunter
    def eat_by_age
      1.0 - AgeLogistic[age]
    end

    def eat_by_health
      HealthLogistic[health]
    end

    def eat_by_vigor
      VigorLogistic[vigor]
    end

    # As prey
    def eaten_by_age
      AgeLogistic[age]
    end

    def eaten_by_health
      1.0 - HealthLogistic[health]
    end

    def eaten_by_vigor
      1.0 - VigorLogistic[vigor]
    end
end
