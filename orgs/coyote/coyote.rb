# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'coyote_parms'

class Coyote < Orgbase
  include CoyoteParms

  class << self
    def age_curve; @age_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.25, x0:10).round(4) }; end
    def health_curve; @health_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }; end
    def vigor_curve; @vigor_curve ||= Hash.new {|h,key| h[key] = logistic(x: 2*key, k:0.15, x0:100).round(4) }; end

    def fertility_by_age;       @coy_age_fertility ||= coy_age_fertility; end
    def fertility_color_adjust; @coy_fert_color_adj ||= coy_fert_color_adj; end

    def survive_by_age;        @coy_age_survival ||= coy_age_survival; end
    def survival_color_adjust; @coy_surv_color_adj ||= coy_surv_color_adj; end
  end

  def self.species; 'coyote'; end

  def initialize(color: 'black')
    super(color: color)
    nil
  end
end
