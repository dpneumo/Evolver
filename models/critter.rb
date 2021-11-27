# frozen_string_literal: true

class Critter
  attr_accessor :age, :health
  attr_reader :id, :parent_id, :children_ids,
              :color_id, :color_name

  def initialize(toolbox:,
                 parent_id: nil, children_ids: nil,
                 color_id: nil, age: nil)
    @id           = toolbox.id_generator.next
    @parent_id    = parent_id    || 0
    @children_ids = children_ids || []
    @color_id     = color_id     || 1
    @age          = age          || 0
    @health       = health       || 1.0
    @color_name   = toolbox.colors.color_names[@color_id]
  end
end
