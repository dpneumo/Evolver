# frozen_string_literal: true

class Fertility
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
  end

  def probability(age:, color_id:)
    return 0.00 unless valid?(age) && valid?(color_id)

    adjusted_fertility(age, color_id).clamp(0.0, 1.0)
  end

  private

  def birth_prob_by_age
    prob = Hash.new { |h, age| h[age] = 0.00 }
    prob[2] = 0.05
    prob[3] = 0.40
    prob[4] = 0.30
    prob[5] = 0.20
    prob[6] = 0.05
    prob
  end

  def adjustment_by_color
    adj = Hash.new { |h, color_id| h[color_id] = 0.00 }
    adj[0] = +1.00
    adj[1] = +0.10
    adj[2] = -0.05
    adj[3] = +0.00
    adj[4] = -0.10
    adj
  end

  def adjustment_by_resource
    @resource.level - 1.0
  end

  def valid?(parm)
    (parm.is_a? Integer) && parm >= 0
  end

  def adjusted_fertility(age, color_id)
    birth_prob_by_age[age] + adjustment_by_color[color_id] + adjustment_by_resource
  end
end
