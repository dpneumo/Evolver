# frozen_string_literal: true

module CoyoteColors
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
end
