class Publisher
  include UtilityMethods

  def initialize(stats:, statements: Statements)
    @stats = stats
    @statements = statements.new
    nil
  end

  def publish
    @statements.period_stats(pop_stats_by_period)
    @statements.death_stats(mean_age_at_death_all)
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
