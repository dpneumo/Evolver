# frozen_string_literal: true

class Resource

  CarryCap = 100

  def initialize(statstore:)
    @store = statstore
  end

  def level
    CarryCap.fdiv(population).clamp(0.0, 1.0)
  end

  private
    def population
      return 1 if @store.pop_counts.empty?
      @store.pop_counts[last_period][:count]
    end

    def last_period
      @store.pop_counts.keys.last
    end
end
