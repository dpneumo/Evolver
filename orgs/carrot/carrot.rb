# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'carrot_parms'

class Carrot < Orgbase
  include CarrotParms

  class << self
    def age_curve;    @age_curve ||= Hash.new {|h,key| h[key] = 1.0 }; end
    def health_curve; @health_curve ||= Hash.new {|h,key| h[key] = 0.0 }; end
    def vigor_curve;  @vigor_curve ||= Hash.new {|h,key| h[key] = 0.0 }; end

    def fertility_by_age;       @car_age_fertility ||= car_age_fertility; end
    def fertility_color_adjust; @car_fert_color_adj ||= car_fert_color_adj; end

    def survive_by_age;        @car_age_survival ||= car_age_survival; end
    def survival_color_adjust; @car_surv_color_adj ||= car_surv_color_adj; end

  end

  def self.species; 'carrot'; end

  def initialize(color: 'yellow')
    super(color: color)
    nil
  end
end
