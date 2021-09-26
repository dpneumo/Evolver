# frozen_string_literal: true

class Populator
  def initialize(toolbox)
    @toolbox = toolbox
  end

  def populate(size)
    size.times.map do |_n|
      Critter.new(@toolbox)
    end
  end
end
