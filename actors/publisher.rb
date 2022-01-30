class Publisher
  include UtilityMethods

  def initialize(toolbox:)
    @stats = toolbox.stats
  end

  def publish
    puts <<~TEXT
      pop stats by period:
      #{pop_stats_by_period}
      mean age at death by_species:
      #{mean_age_at_death_all}
    TEXT
    nil
  end

  private
    def mean_age(count, summed_ages)
      mean(count: count, sum: summed_ages).round(2)
    end

    def pop_stats_by_period
      @stats.pop_counts.each.inject('') do |text, (period, species_data)|
        text << "  period: #{period}\n"
        text << species_data.each.inject('') do |txt, (species, sums)|
                  count = sums[:summed_count]; summed_ages = sums[:summed_ages]
                  txt << "    species: #{species}, population: #{count}, mean age: #{mean_age(count, summed_ages)}\n"
                  txt
                end
        text
      end
    end

    def mean_age_at_death_all
      @stats.dac_all.each.inject('') do |txt, (species, sums)|
        count = sums[:summed_count]; summed_ages = sums[:summed_ages]
        txt << "  species: #{species}, mean_age_at_death: #{mean_age(count, summed_ages)}\n"
        txt
      end
    end
end
