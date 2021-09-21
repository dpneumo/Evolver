# frozen_string_literal: true

class Resource

  CarryCap = 100

  def initialize()
    #@stats = stats
  end

  def level
    1.0
  end

  def population(period)
    @stats.pop_counts[period]
  end

end
