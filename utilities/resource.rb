# frozen_string_literal: true

class Resource

  CarryCap = 100

  def initialize(stats:)
    @stats = stats
  end

  def level
    CarryCap.fdiv(population).clamp(0.0, 1.0)
  end

  def population
    return 1 if @stats.pop_counts.empty?
    @stats.pop_counts[last_period][:count]
  end

  def last_period
    @stats.pop_counts.keys.last
  end

end
