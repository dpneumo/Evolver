# frozen_string_literal: true

module CoyoteParms
# Initialize class >instance< variable enctr_sizes_hash
  class << self
    def extended(base)
      base.enctr_sizes_hash = base.enctr_hash
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
  def fert_prob(color:, age:)
    return 0 unless constantize(species).colors.include? color
    parms = fert_parms[color]
    start = age-parms['maturation_start']
    plateau = parms['max_fertility']
    decline = 1 - Math.sqrt(parms['decline_rate']*(age-parms['decline_onset']).clamp(0..))
    [start, plateau, decline].min.clamp(0..1)
  end

  def fert_parms
    {
      'black' => {
        'maturation_start' => 0,
        'max_fertility' => 0.80,
        'decline_onset' => 4,
        'decline_rate' => 4 },
      'brown' => {
        'maturation_start' => 1,
        'max_fertility' => 0.80,
        'decline_onset' => 5,
        'decline_rate' => 1 },
      'gray' => {
        'maturation_start' => 0,
        'max_fertility' => 0.80,
        'decline_onset' => 6,
        'decline_rate' => 1 },
      'white' => {
        'maturation_start' => 1,
        'max_fertility' => 0.80,
        'decline_onset' => 4,
        'decline_rate' => 2 },
    }
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
