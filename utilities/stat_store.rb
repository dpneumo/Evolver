# frozen_string_literal: true

class StatStore
  attr_reader :data, :color_age_counts, :pop_counts,
              :death_counts, :death_age_counts

  def initialize
  	@data = data_hash
    @color_age_counts = color_age_hash
    @pop_counts = population_hash
    @death_counts = death_hash
    @death_age_counts = death_age_hash
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

    def death_hash
      Hash.new { |h, key| h[key] = 0 }
    end

    def death_age_hash
      Hash.new { |h, key| h[key] = 0 }
    end
end
