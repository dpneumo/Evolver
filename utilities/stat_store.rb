# frozen_string_literal: true

class StatStore
  attr_reader :pop_counts, :death_age_counts

  def initialize
  	@data = data_hash
    @color_age_counts = color_age_hash
    @pop_counts = population_hash
    @death_age_counts = death_age_hash
  end

  def save_raw_data(critters:, period:)
    critters.each do |c|
      color = c.color_name.to_sym
      age = c.age
      @data[period][color][age] += 1
    end
  end

  def build_color_stats(period:)
    @data[period].each do |color, agedata|
      agedata.each do |age, cnt|
        @color_age_counts[period][color][:weighted_age] += age * cnt
        @color_age_counts[period][color][:count] += cnt
      end
    end
  end

  def build_population_stats(period:)
    @color_age_counts[period].each do |color, data|
      @pop_counts[period][:weighted_age] += data[:weighted_age]
      @pop_counts[period][:count] += data[:count]
    end
  end

  def build_death_stats(critter:)
    @death_age_counts[critter.color_id][:weighted_age] += critter.age
    @death_age_counts[critter.color_id][:count] += 1
  end

  private
    def data_hash
      Hash.new do |h, period|
        h[period] = Hash.new do |h1, color|
          h1[color] = Hash.new do |h2, age|
            h2[age] = 0
          end
        end
      end
    end

    def color_age_hash
      Hash.new do |h, period|
        h[period] = Hash.new do |h1, color|
          h1[color] = Hash.new do |h2, key|
            h2[key] = 0
          end
        end
      end
    end

    def population_hash
      Hash.new do |h, period|
        h[period] = Hash.new do |h1, key|
          h1[key] = 0
        end
      end
    end

    def death_age_hash
      Hash.new do |h, color|
        h[color] = Hash.new do |h1, key|
          h1[key] = 0
        end
      end
    end
end
