# frozen_string_literal: true

class Publisher
  include UtilityMethods

  def initialize(toolbox:)
    @stats = toolbox.stats
  end

  def publish
    @stats.pop_counts.each do |period, data|
      puts "period: #{period}, population: #{data[:count]}, mean age: #{mean_age(data)}"
    end
    puts "\n"
    puts "mean age at death (all): #{mean_age_at_death('all')}"
  end

  private
    def mean_age(data)
      mean(data[:count], data[:weighted_age]).round(2)
    end

    def mean_age_at_death(color_id)
      count = death_data(color_id)[:count]
      weighted_age = death_data(color_id)[:weighted_age]
      mean(count, weighted_age).round(2)
    end

    def death_data(color_id)
      @stats.death_age_counts[color_id]
    end
end
