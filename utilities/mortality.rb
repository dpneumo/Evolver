# frozen_string_literal: true

class Mortality
  def initialize(resource:)
    @resource = resource
  end

  def probability(age:, color_id:)
    return 0.00 unless valid?(age) && valid?(color_id)

    adjusted_mortality(age, color_id).clamp(0.0, 1.0)
  end

  private

  def death_prob_by_age
    prob = Hash.new { |h, age| h[age] = 1.00 }
    prob[0] = 0.00
    prob[1] = 0.00
    prob[2] = 0.00
    prob[3] = 0.05
    prob[4] = 0.10
    prob[5] = 0.15
    prob[6] = 0.30
    prob[7] = 0.50
    prob[8] = 0.80
    prob[9] = 0.90
    prob
  end

  def adjustment_by_color
    adj = Hash.new { |h, color_id| h[color_id] = 0.00 }
    adj[0] = 1.00
    adj[1] = 0.00
    adj[2] = 0.00
    adj[3] = 0.00
    adj[4] = 0.00
    adj
  end

  def adjustment_by_resource
    1.0 - @resource.level
  end

  def valid?(parm)
    (parm.is_a? Integer) && parm >= 0
  end

  def adjusted_mortality(age, color_id)
    death_prob_by_age[age] + adjustment_by_color[color_id] + adjustment_by_resource
  end
end
