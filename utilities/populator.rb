# frozen_string_literal: true

class Populator
  def initialize(toolbox)
    @id_generator = toolbox.id_generator
  end

  def populate(size)
    size.times.map do |_n|
      Critter.new(@id_generator.next)
    end
  end
end
