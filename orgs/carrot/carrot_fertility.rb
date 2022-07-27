# frozen_string_literal: true

module CarrotFertility
  private
    def fertility_by_age(age)
      @car_age_fertility ||= car_age_fertility
      @car_age_fertility[age]
    end

    def fertility_color_adjust(color)
      @car_fert_color_adj ||= car_fert_color_adj
      @car_fert_color_adj[color]
    end

    def car_age_fertility
      fert = Hash.new { |h, age| h[age] = 1.00 }
      fert[0] = 1.00
      fert[1] = 1.00
      fert[2] = 1.00
      fert
    end

    def car_fert_color_adj
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['yellow'] = 1.10
      adj['red']    = 0.95
      adj['test_color1'] = 0.25
      adj['test_color2'] = 2.00
      adj
    end
end
