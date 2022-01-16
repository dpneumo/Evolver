# frozen_string_literal: true

class StatStore
  attr_reader :pop_counts, :color_age_counts, :death_age_counts

  def initialize
  	@data = data_hash
    @color_age_counts = color_age_hash
    @pop_counts = population_hash
    @death_age_counts = death_age_hash
  end

  def save_raw_data(critters:, period:)
    critters.each do |c|
      species = c.species
      color = c.color
      age = c.age
      unless save(period,species,color,age)
        puts "\nCritter: #{c}, Period: #{period}, Species: #{species}, Color: #{color}, Age: #{age}"
      end
    end
    nil
  end

  def build_death_stats(critter:)
    species = critter.species
    @death_age_counts[species][critter.color][:summed_ages] += critter.age
    @death_age_counts[species][critter.color][:summed_count] += 1
    nil
  end

  private
    def save(period, species, color, age)
      return false unless valid?(period, species, color, age)
      @data[period][species][color][age] += 1
      @color_age_counts[period][species][color][:summed_ages] += age
      @color_age_counts[period][species][color][:summed_count] += 1
      @pop_counts[period][species][:summed_ages] += age
      @pop_counts[period][species][:summed_count] += 1
      true
    end

    def valid?(*args)
      args.each do |arg|
        return false unless valid_class?(arg)
      end
      true
    end

    def valid_class?(a)
      [Integer, String].include?(a.class)
    end

    def data_hash
      Hash.new do |h, period|
        h[period] = Hash.new do |h1, species|
          h1[species] = Hash.new do |h2, color|
            h2[color] = Hash.new do |h3, age|
              h3[age] = 0
            end
          end
        end
      end
    end

    def color_age_hash
      Hash.new do |h, period|
        h[period] = Hash.new do |h1, species|
          h1[species] = Hash.new do |h2, color|
            h2[color] = Hash.new do |h3, key|
              h3[key] = 0
            end
          end
        end
      end
    end

    def population_hash
      Hash.new do |h, period|
        h[period] = Hash.new do |h1, species|
          h1[species] = Hash.new do |h2, key|
            h2[key] = 0
          end
        end
      end
    end

    def death_age_hash
      Hash.new do |h, species|
        h[species] = Hash.new do |h1, color|
          h1[color] = Hash.new do |h2, key|
            h2[key] = 0
          end
        end
      end
    end
end
