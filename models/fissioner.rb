# frozen_string_literal: true

class Fissioner
  include UtilityMethods

  def initialize(toolbox:)
    @toolbox = toolbox
    @fertility = toolbox.fertility
  end

  def birth(critters:)
    critters.map {|critter| [critter, new_child(critter)] }
            .flatten
            .compact
  end

  private
    def new_child(critter)
      return unless child_this_period?(critter)

      Critter.new(toolbox: @toolbox,
                  color_id: child_color_id(critter))
    end

    def child_this_period?(critter)
      flip(biased_coin: biased_coin(critter))
    end

    def child_color_id(critter)
      roll(loaded_die: loaded_die(critter.color_id))
    end

    def loaded_die(color_id)
      @toolbox.colors.mutations[color_id]
    end

    def biased_coin(critter)
      @fertility.probability(age: critter.age, color_id: critter.color_id)
    end
end

