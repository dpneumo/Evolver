# frozen_string_literal: true
require_relative 'stat_store'

class Stats
  def initialize(store:)
    @store = store
    nil
  end

  def add_population_data(creatures:, period:)
    creatures.census.each do |_, list|
      @store.save_raw_data(critters: list, period: period)
    end
    nil
  end

  def add_death_data(critter:)
    @store.build_death_stats(critter: critter)
    nil
  end

  def pop_counts
    @store.pop_counts
  end

  def species_count(period:, species:)
    @store.pop_counts[period][species][:summed_count]
  end

  def death_age_counts(species:, color:)
    @store.death_age_counts[species][color]
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
