# frozen_string_literal: true

module CarrotColors
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
end
