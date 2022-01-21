# frozen_string_literal: true

module CoyoteVitality
  def survival_probability(age:, color:)
    return 1.00 unless valid?(age) && valid?(color)

    adjusted_vitality(age, color).clamp(0.0, 1.0)
  end

  private
    def adjusted_vitality(age, color)
      survive_prob_by_age[age] * (adjustment_by_color[color] || 1.0)
    end

    def survive_prob_by_age
      prob = Hash.new { |h, age| h[age] = 0.00 }
      prob[0] = 1.00
      prob[1] = 1.00
      prob[2] = 1.00
      prob[3] = 0.95
      prob[4] = 0.90
      prob[5] = 0.85
      prob[6] = 0.70
      prob[7] = 0.50
      prob[8] = 0.20
      prob[9] = 0.0
      prob
    end

    def adjustment_by_color
      {
        'test_color' => 1.00,
        'black'      => 1.00,
        'brown'      => 0.00,
        'gray'       => 2.00,
        'white'      => 1.00,
      }
    end

    def valid?(parm)
       (parm.is_a? String) || ((parm.is_a? Integer) && parm >= 0)
    end
end
