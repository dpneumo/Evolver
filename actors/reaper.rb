# frozen_string_literal: true

require_relative '../storage/stats'

class Reaper
  include UtilityMethods

  def initialize(stats:)
    @stats = stats
    nil
  end

  def survive(creatures:)
    creatures.census = new_census(creatures)
    nil
  end

  private
    def new_census(creatures)
      creatures.census.reduce({}) do |new_census, (species, list)|
        new_list = list.select { |critter| survives_this_period?(critter) }
        new_census.update( species => new_list )
      end
    end

    def survives_this_period?(critter)
      lives = will_live?(critter)
      @stats.add_death_data(critter: critter) unless lives
      lives
    end

    def will_live?(critter)
      flip(biased_coin: vitality_biased_coin(critter))
    end

    def vitality_biased_coin(critter)
      class_survival_prob(critter) * individual_survival_prob(critter)
    end

    def class_survival_prob(critter)
      critter.class.survival_probability(age: critter.age, color: critter.color)
    end

    def individual_survival_prob(critter)
      critter.health.fdiv(critter.class.max_health)
    end
end
