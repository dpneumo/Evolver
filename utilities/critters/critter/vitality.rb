# frozen_string_literal: true

class Utilities::Critters::Critter::Vitality
  def initialize(resource:)
    @resource = resource
  end

  def probability(age:, color_id:)
    return 1.00 unless valid?(age) && valid?(color_id)

    adjusted_vitality(age, color_id)
  end

  private

  def adjusted_vitality(age, color_id)
    survive_prob_by_age[age] * adjustment_by_color[color_id] * adjustment_by_resource
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
    adj = Hash.new { |h, color_id| h[color_id] = 0.00 }
    adj[0] = 0.00
    adj[1] = 1.00
    adj[2] = 1.00
    adj[3] = 1.00
    adj[4] = 1.00
    adj
  end

  def adjustment_by_resource
    @resource.level
  end

  def valid?(parm)
    (parm.is_a? Integer) && parm >= 0
  end
end
