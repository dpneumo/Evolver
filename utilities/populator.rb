# frozen_string_literal: true

class Populator
  def initialize(id_generator)
    @id_generator = id_generator
  end

  def populate(size)
    size.times.map do |_n|
      Critter.new(@id_generator.next)
    end
  end
end
