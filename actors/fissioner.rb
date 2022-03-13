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
      list.map {|critter| new_child(critter) }.compact
    end

    def new_child(critter)
      return unless child_this_period?(critter)

      critter.class.new(color: child_color(critter))
    end

    def child_this_period?(critter)
      flip(biased_coin: biased_coin(critter))
    end

    def biased_coin(critter)
      critter.class.birth_probability(age: critter.age, color: critter.color)
    end

    def child_color(critter)
      roll(loaded_die: loaded_die(critter))
    end

    def loaded_die(critter)
      critter.class.mutations[critter.color]
    end
end

