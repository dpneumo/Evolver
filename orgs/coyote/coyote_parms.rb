# frozen_string_literal: true

module CoyoteParms
# Initialize class >instance< variable enctr_sizes_hash
  class << self
    def extended(base)
      if base.method_defined?(:enctr_hash)
        base.enctr_sizes_hash = base.enctr_hash
      end
    end
  end

# Colors
  def colors
    ['black', 'brown', 'gray', 'white', 'test_color']
  end

  def mutations
    {
      'black' => {
          'test_color' => 0.00,
          'black' =>      0.70,
          'brown' =>      0.20,
          'gray' =>       0.05,
          'white' =>      0.05,
      },
      'brown' => {
          'test_color' => 0.00,
          'black' =>      0.05,
          'brown' =>      0.60,
          'gray' =>       0.30,
          'white' =>      0.05,
      },
      'gray' =>  {
          'test_color' => 0.00,
          'black' =>      0.15,
          'brown' =>      0.30,
          'gray' =>       0.50,
          'white' =>      0.05,
      },
      'white' => {
          'test_color' => 0.00,
          'black' =>      0.10,
          'brown' =>      0.05,
          'gray' =>       0.05,
          'white' =>      0.80,
      },
      'test_color' => {
          'test_color' => 1.00,
          'black' =>      0.00,
          'brown' =>      0.00,
          'gray' =>       0.00,
          'white' =>      0.00,
      },
    }
  end

# Encounters
  def satiety; 20; end
  def enctr_scale; 4.7; end

  private
  
# Fertility
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

# Survival
    def coy_age_survival
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

    def coy_surv_color_adj
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['black'] = 1.10
      adj['brown'] = 1.00
      adj['gray']  = 1.00
      adj['white'] = 1.00
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end
end
