# frozen_string_literal: true
require_relative 'stat_store'

class Stats
  def initialize(statstore:)
    @store = statstore
  end

  def add_population_data(critters, period)
    @store.save_raw_data(critters, period)
    @store.build_color_stats(period)
    @store.build_population_stats(period)
  end

  def add_death_data(critter)
    @store.build_death_stats(critter)
  end

  def pop_counts
    @store.pop_counts
  end

  def death_counts
    @store.death_counts
  end

  def death_age_counts
    @store.death_age_counts
  end
end
