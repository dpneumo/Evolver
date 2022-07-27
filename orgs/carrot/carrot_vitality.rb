# frozen_string_literal: true

module CarrotVitality
  private
    def survive_by_age(age)
      @car_age_survival ||= car_age_survival
      @car_age_survival[age]
    end

    def survival_color_adjust(color)
      @car_surv_color_adj ||= car_surv_color_adj
      @car_surv_color_adj[color]
    end

    def car_age_survival
      Hash.new { |h, age| h[age] = 1.00 }
    end

    def car_surv_color_adj
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['yellow'] = 1.00
      adj['red']    = 1.00
      adj['test_color1'] = 0.25
      adj['test_color2'] = 2.00
      adj
    end
end
