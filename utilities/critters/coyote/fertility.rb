# frozen_string_literal: true

class Utilities::Critters::Coyote::Fertility
  def initialize(resource:)
    @resource = resource
  end

  def probability(age:, color_id:)
    return 0.00 unless valid?(age) && valid?(color_id)

    adjusted_fertility(age, color_id).clamp(0.0, 1.0)
  end

  private

  def adjusted_fertility(age, color_id)
    birth_prob_by_age[age] * adjustment_by_color[color_id] * adjustment_by_resource
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
    adj = Hash.new { |h, color_id| h[color_id] = 0.00 }
    adj[0] = 1.00
    adj[1] = 1.10
    adj[2] = 0.95
    adj[3] = 1.30
    adj[4] = 0.90
    adj
  end

  def adjustment_by_resource
    @resource.level
  end

  def valid?(parm)
    (parm.is_a? Integer) && parm >= 0
  end
end
