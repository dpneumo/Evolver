# frozen_string_literal: true

module CritterParms
# Initialize class >instance< variable enctr_sizes_hash
  class << self
    def extended(base)
      base.enctr_sizes_hash = base.enctr_hash
    end
  end

# Colors
  def colors
    ['blue', 'green', 'red', 'yellow', 'test_color']
  end

  def mutations
    {
      'blue' => {
          'test_color' => 0.00,
          'red' =>        0.15,
          'green' =>      0.30,
          'blue' =>       0.50,
          'yellow' =>     0.05,
      },
      'green' => {
          'test_color' => 0.00,
          'red' =>        0.10,
          'green' =>      0.80,
          'blue' =>       0.05,
          'yellow' =>     0.05,
      },
      'red' => {
          'test_color' => 0.00,
          'red' =>        0.70,
          'green' =>      0.20,
          'blue' =>       0.05,
          'yellow' =>     0.05,
      },
      'yellow' => {
          'test_color' => 0.00,
          'red' =>        0.05,
          'green' =>      0.05,
          'blue' =>       0.30,
          'yellow' =>     0.60,
      },
      'test_color' => {
          'test_color' => 1.00,
          'red' =>        0.00,
          'green' =>      0.00,
          'blue' =>       0.00,
          'yellow' =>     0.00,
      },
    }
  end

# Encounters
  def satiety; 20; end
  def enctr_scale; 5.0; end

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
  def fert_parms
    {
      'blue' => {
        'maturation_start' => 2,
        'max_fertility' => 0.80,
        'decline_onset' => 6,
        'decline_rate' => 1 },
      'green' => {
        'maturation_start' => 0,
        'max_fertility' => 0.80,
        'decline_onset' => 4,
        'decline_rate' => 1 },
      'red' => {
        'maturation_start' => 1,
        'max_fertility' => 1.00,
        'decline_onset' => 6,
        'decline_rate' => 0.25 },
      'yellow' => {
        'maturation_start' => 2,
        'max_fertility' => 0.80,
        'decline_onset' => 5,
        'decline_rate' => 1 },
    }
  end

# Survival
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
    adj = Hash.new {|h, color| h[color] = 0.0 }
    adj['blue']        = 1.00
    adj['green']       = 0.00
    adj['red']         = 2.00
    adj['yellow']      = 1.00
    adj['test_color1'] = 1.00
    adj['test_color2'] = 2.00
    adj
  end
end
