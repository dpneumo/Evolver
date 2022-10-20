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
  def vit_parms
    {
      'black' => {
        'slope' => 0.25,
        'midpoint' => 4 },
      'brown' => {
        'slope' => 0.8,
        'midpoint' => 4 },
      'gray' => {
        'slope' => 0.5,
        'midpoint' => 4 },
      'white' => {
        'slope' => 1,
        'midpoint' => 4 },
    }
  end
end
