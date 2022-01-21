# frozen_string_literal: true

module CoyoteFertility
  def birth_probability(age:, color:)
    return 0.00 unless (valid?(age) && valid?(color))

    adjusted_fertility(age, color).clamp(0.0, 1.0)
  end

  private
    def adjusted_fertility(age, color)
      birth_prob_by_age[age] * (adjustment_by_color[color] || 0.0)
    end

    def birth_prob_by_age
      prob = Hash.new { |h, age| h[age] = 0.00 }
      prob[2] = 0.05
      prob[3] = 0.80
      prob[4] = 0.50
      prob[5] = 0.20
      prob[6] = 0.05
      prob
    end

    def adjustment_by_color
      {
        'test_color' => 1.00,
        'black'      => 1.10,
        'brown'      => 0.95,
        'gray'       => 1.30,
        'white'      => 0.90,
      }
    end

    def valid?(parm)
      (parm.is_a? String) || ((parm.is_a? Integer) && parm >= 0)
    end
end
