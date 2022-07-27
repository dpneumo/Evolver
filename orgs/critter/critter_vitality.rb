# frozen_string_literal: true

module CritterVitality
  private
    def survive_by_age(age)
      @crt_age_survival ||= crt_age_survival
      @crt_age_survival[age]
    end

    def survival_color_adjust(color)
      @crt_surv_color_adj ||= crt_surv_color_adj
      @crt_surv_color_adj[color]
    end

    def crt_age_survival
      surv = Hash.new { |h, age| h[age] = 0.00 }
      surv[0] = 1.00
      surv[1] = 1.00
      surv[2] = 1.00
      surv[3] = 0.95
      surv[4] = 0.90
      surv[5] = 0.85
      surv[6] = 0.70
      surv[7] = 0.50
      surv[8] = 0.20
      surv[9] = 0.0
      surv
    end

    def crt_surv_color_adj
      adj = Hash.new {|h, color| h[color] = 1.0 }
      adj['blue']        = 1.00
      adj['green']       = 0.00
      adj['red']         = 2.00
      adj['yellow']      = 1.00
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end
end
