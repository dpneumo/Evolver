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
        new_list = list.select { |creature| survives_this_period?(creature) }
        new_census.update( species => new_list )
      end
    end

    def survives_this_period?(creature)
      lives = will_live?(creature)
      @stats.add_death_data(creature: creature) unless lives
      lives
    end

    def will_live?(creature)
      flip(biased_coin: vitality_biased_coin(creature))
    end

    def vitality_biased_coin(creature)
      klass = creature.class.superclass
      klass.survival_probability( species: creature.species, 
                                  age: creature.age, 
                                  color: creature.color )
    end

    # Will use this when health taken into account
    def individual_survival_prob(creature)
      creature.health.fdiv(creature.class.max_health)
    end
end
