# frozen_string_literal: true
require_relative 'stat_store'

class Stats
  def initialize(store:)
    @store = store
  end

  def add_population_data(critters:, period:)
    @store.save_raw_data(critters: critters, period: period)
    @store.build_color_stats(period: period)
    @store.build_population_stats(period: period)
    nil
  end

  def add_death_data(critter:)
    @store.build_death_stats(critter: critter)
    nil
  end

  def pop_counts
    @store.pop_counts
  end

  def death_age_counts(color_id:)
    @store.death_age_counts[color_id]
  end

  def dac_all
    dac = {count: 0, summed_ages: 0}
    @store.death_age_counts.each_value.reduce(dac) do |dac, val|
      dac[:count] += val[:count]
      dac[:summed_ages] += val[:summed_ages]
      dac
    end
  end
end
