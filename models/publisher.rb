# frozen_string_literal: true

class Publisher
  include UtilityMethods

  def publish(statstore)
    statstore.pop_counts.each do |period, data|
      puts "period: #{period}, population: #{data[:count]}, mean age: #{mean_age(data)}"
    end
    puts "\n"
    puts "mean age at death (all): #{mean_death_age(statstore)}"
  end

  private
    def mean_age(data)
      mean(data[:count], data[:weighted_age]).round(2)
    end

    def mean_death_age(statstore)
      mean(statstore.death_counts['all'], statstore.death_age_counts['all']).round(2)
    end
end
