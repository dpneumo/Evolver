# frozen_string_literal: true

module RabbitParms
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
    ['beige', 'black', 'chocolate', 'white', 'test_color']
  end

  def mutations
    {
      'beige' =>     {
          'test_color' => 0.00,
          'beige' =>      0.70,
          'black' =>      0.20,
          'chocolate' =>  0.05,
          'white' =>      0.05,
      },
      'black' =>     {
          'test_color' => 0.00,
          'beige' =>      0.10,
          'black' =>      0.80,
          'chocolate' =>  0.05,
          'white' =>      0.05,
      },
      'chocolate' => {
          'test_color' => 0.00,
          'beige' =>      0.05,
          'black' =>      0.05,
          'chocolate' =>  0.60,
          'white' =>      0.30,
      },
      'white' =>     {
          'test_color' => 0.00,
          'beige' =>      0.15,
          'black' =>      0.30,
          'chocolate' =>  0.05,
          'white' =>      0.50,
      },
      'test_color' => {
          'test_color' => 1.00,
          'beige' =>      0.00,
          'black' =>      0.00,
          'chocolate' =>  0.00,
          'white' =>      0.00,
      },
    }
  end

# Encounters
  def satiety; 20; end
  def enctr_scale; 20.0; end

  private
  
#Fertility
    def rab_age_fertility
      fert = Hash.new { |h, age| h[age] = 0.00 }
      fert[0] = 0.05
      fert[1] = 0.10
      fert[2] = 0.20
      fert[3] = 0.80
      fert[4] = 0.95
      fert[5] = 0.80
      fert[6] = 0.75
      fert[7] = 0.50
      fert[8] = 0.20
      fert[9] = 0.05
      fert
    end

    def rab_fert_color_adj
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['beige']      = 1.10
      adj['black']      = 0.95
      adj['chocolate']  = 1.30
      adj['white']      = 0.90
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end

#Survival
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
      adj = Hash.new {|h, color| h[color] = 0.0 }
      adj['beige']      = 1.10
      adj['black']      = 1.00
      adj['chocolate']  = 1.00
      adj['white']      = 1.00
      adj['test_color1'] = 1.00
      adj['test_color2'] = 2.00
      adj
    end
end
