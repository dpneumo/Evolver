# frozen_string_literal: true

class Fissioner
  include UtilityMethods

  def initialize(toolbox:)
    @toolbox = toolbox
    @id_generator = toolbox.id_generator
    @fertility = toolbox.fertility
  end

  def birth(critters:)
    critters.map do |critter|
      child = new_child(critter)
      critter.children_ids << child.id if child
      [critter, child]
    end.flatten.compact
  end

  private
    def new_child(critter)
      return unless child_this_period?(critter)

      Critter.new(toolbox: @toolbox,
                  parent_id: critter.id,
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
