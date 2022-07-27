# frozen_string_literal: true

module CoyoteFertility
  private
    def fertility_by_age(age)
      @coy_age_fertility ||= coy_age_fertility
      @coy_age_fertility[age]
    end

    def fertility_color_adjust(color)
      @coy_fert_color_adj ||= coy_fert_color_adj
      @coy_fert_color_adj[color]
    end

    def coy_age_fertility
      fert = Hash.new {|h, age| h[age] = 0.00 }
      fert[0] = 0.05
      fert[1] = 0.10
      fert[2] = 0.20
      fert[3] = 0.80
      fert[4] = 0.50
      fert[5] = 0.20
      fert[6] = 0.05
      fert
    end

    def coy_fert_color_adj
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['black'] = 1.10
      adj['brown'] = 0.95
      adj['gray']  = 1.30
      adj['white'] = 0.90
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end
end
