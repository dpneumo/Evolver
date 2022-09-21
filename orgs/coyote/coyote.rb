# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'coyote_encounters'
require_relative 'coyote_colors'
require_relative 'coyote_fertility'
require_relative 'coyote_vitality'

class Coyote < Orgbase
  extend CoyoteEncounters
  extend CoyoteColors
  extend CoyoteFertility
  extend CoyoteVitality

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

  def self.species; 'coyote'; end

  def initialize(color: 'black')
    super(color: color)
    nil
  end
end
