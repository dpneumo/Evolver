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

  class << self
    def age_curve
      @age_curve ||= Hash.new {|h,key| h[key] = 1.0 }
    end

    def health_curve
      @health_curve ||= Hash.new {|h,key| h[key] = 0.0 }
    end

    def vigor_curve
      @vigor_curve ||= Hash.new {|h,key| h[key] = 0.0 }
    end
  end

  def self.species; 'carrot'; end

  def initialize(color: 'yellow')
    super(color: color)
    nil
  end
end
