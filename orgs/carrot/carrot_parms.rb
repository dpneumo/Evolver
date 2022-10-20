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
  def fert_parms
    {
      'yellow' => {
        'maturation_start' => 0,
        'max_fertility' => 1.00,
        'decline_onset' => 10,
        'decline_rate' => 1 },
      'red' => {
        'maturation_start' => 0,
        'max_fertility' => 0.80,
        'decline_onset' => 6,
        'decline_rate' => 1 },
    }
  end

# Survival
  def vit_prob(color:, age:)
    return 0.00 unless constantize(species).colors.include? color
    1.00
  end
end
