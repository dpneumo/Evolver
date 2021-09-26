# frozen_string_literal: true
require_relative 'stat_store'

class Stats
  def initialize(statstore:)
    @store = statstore
  end

  def add_population_data(critters, period)
    save_raw_data(critters, period)
    build_color_stats(period)
    build_population_stats(period)
  end

  def add_death_data(critter)
    build_death_stats(critter)
  end

  private
    def save_raw_data(critters, period)
      critters.each do |c|
        color = Colors.colors[c.color_id].to_sym
        age = c.age
        @store.data[period][color][age] += 1
      end
    end

    def build_color_stats(period)
      @store.data[period].each do |color, agedata|
        agedata.each do |age, cnt|
          @store.color_age_counts[period][color][:weighted_age] += age * cnt
          @store.color_age_counts[period][color][:count] += cnt
        end
      end
    end

    def build_population_stats(period)
      @store.color_age_counts[period].each do |_color, data|
        @store.pop_counts[period][:weighted_age] += data[:weighted_age]
        @store.pop_counts[period][:count] += data[:count]
      end
    end

    def build_death_stats(critter)
      @store.death_counts[critter.color_id] += 1
      @store.death_counts['all'] += 1
      @store.death_age_counts[critter.color_id] += critter.age
      @store.death_age_counts['all'] += critter.age
    end
end
