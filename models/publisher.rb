# frozen_string_literal: true

class Publisher
  include UtilityMethods

  def initialize(toolbox:)
    @stats = toolbox.stats
    @colors = toolbox.colors
  end

  def publish
    @stats.pop_counts.each do |period, data|
      count = data[:count]; weighted_age = data[:weighted_age]
      puts "period: #{period}, population: #{data[:count]}, mean age: #{mean_age(count, weighted_age)}"
    end
    puts "\n"
    puts "mean age at death (all): #{mean_age_at_death_all}\n"
    @colors.colors.each do |k,v|
      puts "mean age at death (#{v}): #{mean_age_at_death(k)}\n"
    end
  end

  private
    def mean_age(count, weighted_age)
      mean(count: count, weighted_value: weighted_age).round(2)
    end

    def mean_age_at_death(color_id)
      stats = @stats.death_age_counts(color_id: color_id)
      mean(count: stats[:count], weighted_value: stats[:weighted_age]).round(2)
    end

    def mean_age_at_death_all
      stats = @stats.dac_all
      mean(count: stats[:count], weighted_value: stats[:weighted_age]).round(2)
    end
end
