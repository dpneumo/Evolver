# frozen_string_literal: true

module RabbitColors
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
end
