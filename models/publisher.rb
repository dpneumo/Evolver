# frozen_string_literal: true

class Publisher
  def publish(stats)
    stats.pop_counts.each do |period, data|
      mean_age = mean(data[:count], data[:weighted_age]).round(2)
      puts "period: #{period}, count: #{data[:count]}, mean age: #{mean_age}"
    end
    mean_death_age = mean(stats.death_counts['all'], stats.death_age_counts['all']).round(2)
    puts "\n"
    puts "mean age at death (all): #{mean_death_age}"
  end

  def mean(total, weighted_value)
    total.zero? ? 0 : weighted_value.fdiv(total)
  end
end
