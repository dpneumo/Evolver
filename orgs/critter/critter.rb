# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'critter_parms'

class Critter < Orgbase
  extend CritterParms

  class << self
    def age_curve;    @age_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:10).round(4) }; end
    def health_curve; @health_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }; end
    def vigor_curve;  @vigor_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }; end

    def survive_by_age;        @crt_age_survival ||= crt_age_survival; end
    def survival_color_adjust; @crt_surv_color_adj ||= crt_surv_color_adj; end
  end

  def self.species; 'critter'; end

  def initialize(color: 'red')
    super(color: color)
    nil
  end
end
