# frozen_string_literal: true

module CarrotParms
# Initialize class >instance< variable enctr_sizes_hash
  class << self
    def extended(base)
      base.enctr_sizes_hash = base.enctr_hash
    end
  end

# Colors
  def colors
    ['yellow', 'red', 'test_color']
  end

  def mutations
    {
      'yellow' => {
          'test_color' => 0.00,
          'yellow' =>     0.80,
          'red' =>        0.20,
      },
      'red' => {
          'test_color' => 0.00,
          'yellow' =>     0.05,
          'red' =>        0.95,
      },
      'test_color' => {
          'test_color' => 1.00,
          'yellow' =>     0.00,
          'red' =>        0.00,
      },
    }
  end

# Encounters
  def satiety; 20; end
  def enctr_scale; 4.7; end

  def enctr_sizes_hash
    @enctr_sizes_hash
  end

  def enctr_sizes_hash=(value)
    @enctr_sizes_hash = value
  end

  # Users of the returned hash MUST insure keys are non-negative Integers
  def enctr_hash
    Hash.new {|h, ratio| h[ratio] = logistic_encounter(ratio) }
  end

# Fertility
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

# Survival
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
