# frozen_string_literal: true

module CritterColors
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
end
