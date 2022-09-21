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

  def self.species; 'rabbit'; end

  def initialize(color: 'black')
    super(color: color)
    nil
  end
end
