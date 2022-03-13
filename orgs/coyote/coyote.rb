# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'coyote_colors'
require_relative 'coyote_fertility'
require_relative 'coyote_vitality'

class Coyote < Orgbase
  extend CoyoteColors
  extend CoyoteFertility
  extend CoyoteVitality

  AgeLogistic =      Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:10).round(4) }
  HealthLogistic =   Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }
  VigorLogistic =    Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }

  def self.species; 'coyote'; end
  def self.satiety; 20; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 4.7; end

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
      1.0
      #HealthLogistic[health]
    end

    def eat_by_vigor
      1.0
      #VigorLogistic[vigor]
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
