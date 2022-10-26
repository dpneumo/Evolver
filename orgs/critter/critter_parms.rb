# frozen_string_literal: true

module CritterParms
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
  def enctr_parms
    {'slope' => 0.25, 'midpoint' => 16,'satiety' => 20 }
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
  def vit_parms
    {
      'blue' => {
        'slope' => 1.00,
        'midpoint' => 6 },
      'green' => {
        'slope' => 1.0,
        'midpoint' => 7 },
      'red' => {
        'slope' => 1.0,
        'midpoint' => 5 },
      'yellow' => {
        'slope' => 1.0,
        'midpoint' => 4 },
    }
  end
end
