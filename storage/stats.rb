# frozen_string_literal: true
require_relative 'stat_store'

class Stats
  def initialize(store:)
    @store = store
  end

  def add_population_data(critters:, period:)
    @store.save_raw_data(critters: critters, period: period)
    nil
  end

  def add_death_data(critter:)
    @store.build_death_stats(critter: critter)
    nil
  end

  def pop_counts
    @store.pop_counts
  end

  def death_age_counts(species:, color_id:)
    @store.death_age_counts[species][color_id]
  end

  def dac_all
    dac = dac_summary_hash
    @store.death_age_counts.each.reduce(dac) do |dac, kv|
      species = kv[0]
      kv[1].each_value do |sums|
        dac[species][:summed_ages] += sums[:summed_ages]
        dac[species][:summed_count] += sums[:summed_count]
      end
      dac
    end
    dac
  end

  def dac_summary_hash
    Hash.new do |h, species|
      h[species] = {summed_count: 0, summed_ages: 0}
    end
  end
end
