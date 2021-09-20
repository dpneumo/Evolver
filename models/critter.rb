# frozen_string_literal: true

class Critter
  attr_accessor :age
  attr_reader :id, :parent_id, :children_ids, :color_id

  def initialize(id_generator,
                 parent_id: nil, children_ids: nil,
                 color_id: nil, age: nil)
    @id           = id_generator.next
    @parent_id    = parent_id    || 0
    @children_ids = children_ids || []
    @color_id     = color_id     || 1
    @age          = age          || 0
  end
end
