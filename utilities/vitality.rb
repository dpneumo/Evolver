# frozen_string_literal: true

class Vitality
  def initialize(resource:)
    @resource = resource
  end

  def probability(age:, color:)
    return 1.00 unless valid?(age) && valid?(color)

    adjusted_vitality(age, color)
  end

  private

  def adjusted_vitality(age, color)
    survive_prob_by_age[age] * adjustment_by_color[color] * adjustment_by_resource
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
      'test_color' => 0.00,
      'black'      => 1.00,
      'brown'      => 1.00,
      'gray'       => 1.00,
      'white'      => 1.00,
     'blue'      => 1.00,
     'green'      => 1.00,
     'red'      => 1.00,
     'yellow'      => 1.00,
     'beige'      => 1.00,
     'chocolate'      => 1.00,
    }
  end

  def adjustment_by_resource
    @resource.level
  end

  def valid?(parm)
    (parm.is_a? Integer) && parm >= 0
  end
end
