# frozen_string_literal: true

class Fissioner
  include UtilityMethods

  def initialize(toolbox:)
    @toolbox = toolbox
  end

  def birth(critters:)
    critters.map {|critter| [critter, new_child(critter)] }
            .flatten
            .compact
  end

  private
    def new_child(critter)
      return unless child_this_period?(critter)

      critter.class.new(toolbox: @toolbox,
                        color: child_color(critter))
    end

    def child_this_period?(critter)
      flip(biased_coin: biased_coin(critter))
    end

    def child_color(critter)
      roll(loaded_die: loaded_die(critter))
    end

    def loaded_die(critter)
      critter.class.mutations[critter.color]
    end

    def biased_coin(critter)
      critter.class.birth_probability(age: critter.age, color: critter.color)
    end
end

