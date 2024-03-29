# frozen_string_literal: true

module RabbitParms
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

  def enctr_parms
    {'slope' => 0.25, 'midpoint' => 16,'satiety' => 20 }
  end

# Fertility
  def fert_parms
    {
      'beige' => {
        'maturation_start' => 2,
        'max_fertility' => 0.80,
        'decline_onset' => 6,
        'decline_rate' => 1 },
      'black' => {
        'maturation_start' => 0,
        'max_fertility' => 1.00,
        'decline_onset' => 6,
        'decline_rate' => 1 },
      'chocolate' => {
        'maturation_start' => 0,
        'max_fertility' => 1.00,
        'decline_onset' => 8,
        'decline_rate' => 0.5 },
      'white' => {
        'maturation_start' => 2,
        'max_fertility' => 0.80,
        'decline_onset' => 10,
        'decline_rate' => 0.25 },
    }
  end

# Survival
  def vit_parms
    {
      'beige' => {
        'slope' => 0.25,
        'midpoint' => 4 },
      'black' => {
        'slope' => 0.8,
        'midpoint' => 4 },
      'chocolate' => {
        'slope' => 0.5,
        'midpoint' => 4 },
      'white' => {
        'slope' => 1,
        'midpoint' => 4 },
    }
  end
end
