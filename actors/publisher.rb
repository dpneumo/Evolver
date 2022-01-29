# frozen_string_literal: true

class Publisher
  include UtilityMethods

  def initialize(toolbox:)
    @stats = toolbox.stats
  end

  def publish
    puts "pop stats by period:\n"
    pop_stats_by_period
    puts "\n"
    puts "mean age at death by_species:\n"
    mean_age_at_death_all
  end

  private
    def mean_age(count, summed_ages)
      mean(count: count, sum: summed_ages).round(2)
    end

    def pop_stats_by_period
      @stats.pop_counts.each do |period, species_data|
        species_data.each do |species, sums|
          count = sums[:summed_count]; summed_ages = sums[:summed_ages]
          puts "period: #{period}, species: #{species}, population: #{count}, mean age: #{mean_age(count, summed_ages)}"
        end
        puts "\n"
      end
    end

    def mean_age_at_death_all
       @stats.dac_all.each do |species, sums|
        count = sums[:summed_count]; summed_ages = sums[:summed_ages]
        puts "species: #{species}, mean_age_at_death: #{mean_age(count, summed_ages);}"
      end
    end

    def mean_age_at_death(color_id)
      stats = @stats.death_age_counts(color_id: color_id)
      mean(count: stats[:count], sum: stats[:summed_ages]).round(2)
    end
end
