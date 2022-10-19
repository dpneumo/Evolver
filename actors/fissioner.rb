# frozen_string_literal: true

class Fissioner
  include UtilityMethods

  def initialize
    nil
  end

  def reproduce(creatures:)
    creatures.census = new_census(creatures)
    nil
  end

  private
    def new_census(creatures)
      creatures.census.reduce({}) do |census, (species, list)|
        census.update( species => (list + additions(list)) )
      end
    end

    def additions(list)
      list.map {|creature| new_child(creature) }.compact
    end

    def new_child(creature)
      return unless child_this_period?(creature)

      creature.class.new(color: child_color(creature))
    end

    def child_this_period?(creature)
      flip(biased_coin: fertility_biased_coin(creature))
    end

    def fertility_biased_coin(creature)
      creature.class.superclass.birth_probability(species: creature.species, \
                                      age: creature.age, \
                                      color: creature.color)
    end

    def child_color(creature)
      roll(loaded_die: loaded_die(creature))
    end

    def loaded_die(creature)
      creature.class.mutations[creature.color]
    end
end

