# frozen_string_literal: true

class Critter
  attr_accessor :age
  attr_reader :id, :parent_id, :children_ids, :color_id

  def initialize(toolbox:,
                 parent_id: nil, children_ids: nil,
                 color_id: nil, age: nil)
    @colors       = toolbox.colors
    @id           = toolbox.id_generator.next
    @parent_id    = parent_id    || 0
    @children_ids = children_ids || []
    @color_id     = color_id     || 1
    @age          = age          || 0
  end

  def color_name
    @colors.colors[@color_id]
  end
end
