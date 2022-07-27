# frozen_string_literal: true

module CritterFertility
  private
    def fertility_by_age(age)
      @crt_age_fertility ||= crt_age_fertility
      @crt_age_fertility[age]
    end

    def fertility_color_adjust(color)
      @crt_fert_color_adj ||= crt_fert_color_adj
      @crt_fert_color_adj[color]
    end

    def crt_age_fertility
      fert = Hash.new { |h, age| h[age] = 0.00 }
      fert[2] = 0.05
      fert[3] = 0.80
      fert[4] = 0.50
      fert[5] = 0.20
      fert[6] = 0.05
      fert
    end

    def crt_fert_color_adj
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['blue']   = 1.10
      adj['green']  = 0.95
      adj['red']    = 1.30
      adj['yellow'] = 0.90
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end
end
