# frozen_string_literal: true

class Publisher
  include UtilityMethods

  def initialize(toolbox:)
    @stats = toolbox.stats
    @colors = toolbox.colors
  end

  def publish
    @stats.pop_counts.each do |period, data|
      count = data[:count]; summed_ages = data[:summed_ages]
      puts "period: #{period}, population: #{data[:count]}, mean age: #{mean_age(count, summed_ages)}"
    end
    puts "\n"
    puts "mean age at death (all): #{mean_age_at_death_all}\n"
    @colors.color_names.each do |k,v|
      puts "mean age at death (#{v}): #{mean_age_at_death(k)}\n"
    end
  end

  private
    def mean_age(count, summed_ages)
      mean(count: count, sum: summed_ages).round(2)
    end

    def mean_age_at_death(color_id)
      stats = @stats.death_age_counts(color_id: color_id)
      mean(count: stats[:count], sum: stats[:summed_ages]).round(2)
    end

    def mean_age_at_death_all
      stats = @stats.dac_all
      mean(count: stats[:count], sum: stats[:summed_ages]).round(2)
    end
end
