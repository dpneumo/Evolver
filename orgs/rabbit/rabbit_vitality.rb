# frozen_string_literal: true

module RabbitVitality
  private
    def survive_by_age(age)
      @rab_age_survival ||= rab_age_survival
      @rab_age_survival[age]
    end

    def survival_color_adjust(color)
      @rab_surv_color_adj ||= rab_surv_color_adj
      @rab_surv_color_adj[color]
    end

    def rab_age_survival
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

    def rab_surv_color_adj
      adj = Hash.new {|h, color| h[color] = 1.0 }
      adj['beige']      = 1.10
      adj['black']      = 1.00
      adj['chocolate']  = 1.00
      adj['white']      = 1.00
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end
end
