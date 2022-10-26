# frozen_string_literal: true

module CarrotParms
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

  def enctr_parms
    {'slope' => 0.25, 'midpoint' => 16,'satiety' => 20 }
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
  def vit_parms
    {
      'yellow' => {
        'slope' => 1.00,
        'midpoint' => 100 },
      'red' => {
        'slope' => 1.00,
        'midpoint' => 100 },
    }
  end
end
