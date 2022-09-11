# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'rabbit_encounters'
require_relative 'rabbit_colors'
require_relative 'rabbit_fertility'
require_relative 'rabbit_vitality'

class Rabbit < Orgbase
  extend RabbitEncounters
  extend RabbitColors
  extend RabbitFertility
  extend RabbitVitality

  AgeLogistic =      Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:10).round(4) }
  HealthLogistic =   Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }
  VigorLogistic =    Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }

  def self.species; 'rabbit'; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end

  def initialize(color: 'black')
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
    def eaten_vulnerability_by_age
      AgeLogistic[age]
    end

    def eaten_vulnerability_by_health
      1.0 - HealthLogistic[health]
    end

    def eaten_vulnerability_by_vigor
      1.0
      #1.0 - VigorLogistic[vigor]
    end
end
