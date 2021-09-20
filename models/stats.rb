# frozen_string_literal: true

class Stats
  attr_reader :pop_counts, :color_age_counts, :death_counts, :death_age_counts

  def initialize
    @data = data_hash
    @pop_counts = population_hash
    @color_age_counts = color_age_hash
    @death_counts = Hash.new { |h, key| h[key] = 0 }
    @death_age_counts = Hash.new { |h, key| h[key] = 0 }
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

  def save_raw_data(critters, period)
    critters.each do |c|
      color = Colors.colors[c.color_id].to_sym
      age = c.age
      @data[period][color][age] += 1
    end
  end

  def build_color_stats(period)
    @data[period].each do |color, agedata|
      agedata.each do |age, cnt|
        @color_age_counts[period][color][:weighted_age] += age * cnt
        @color_age_counts[period][color][:count] += cnt
      end
    end
  end

  def build_population_stats(period)
    @color_age_counts[period].each do |_color, data|
      @pop_counts[period][:weighted_age] += data[:weighted_age]
      @pop_counts[period][:count] += data[:count]
    end
  end

  def build_death_stats(critter)
    @death_counts[critter.color_id] += 1
    @death_counts['all'] += 1
    @death_age_counts[critter.color_id] += critter.age
    @death_age_counts['all'] += critter.age
  end
end
