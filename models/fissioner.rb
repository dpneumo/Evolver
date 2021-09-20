# frozen_string_literal: true

class Fissioner
  def initialize(id_generator)
    @id_generator = id_generator
    @fertility = Fertility.new
  end

  def birth(critters)
    critters.map do |critter|
      child = new_child(critter)
      critter.children_ids << child.id if child
      [critter, child]
    end.flatten.compact
  end

  private

  def new_child(critter)
    return unless child_this_period?(critter)

    Critter.new(@id_generator,
                parent_id: critter.id,
                color_id: child_color_id(critter))
  end

  def child_this_period?(critter)
    rand < @fertility.probability(critter.age, critter.color_id)
  end

  def child_color_id(critter)
    mutated_color_id(critter.color_id)
  end

  def mutated_color_id(color_id)
    die = loaded_die(color_id)
    die.max_by { |_, weight| rand**(1.0 / weight) }.first
  end

  def loaded_die(color_id)
    Colors.mutations[color_id]
  end
end
