# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'carrot_encounters'
require_relative 'carrot_colors'
require_relative 'carrot_fertility'
require_relative 'carrot_vitality'

class Carrot < Orgbase
  extend CarrotEncounters
  extend CarrotColors
  extend CarrotFertility
  extend CarrotVitality

  AgeLogistic =      Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:10).round(4) }
  HealthLogistic =   Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }
  VigorLogistic =    Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }

  def self.species; 'carrot'; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end

  def initialize(color: 'yellow')
    super(color: color)
    nil
  end

  private
    # As hunter
    def eat_by_age
     0.0
    end

    def eat_by_health
      0.0
    end

    def eat_by_vigor
      0.0
    end

    # As prey
    def eaten_vulnerability_by_age
      1.0
    end

    def eaten_vulnerability_by_health
      1.0
    end

    def eaten_vulnerability_by_vigor
      1.0
    end
end
