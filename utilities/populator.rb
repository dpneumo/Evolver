# frozen_string_literal: true

class Populator
  def initialize(toolbox:)
    @toolbox = toolbox
  end

  def populate(size:, species:)
    size.times.map do |_n|
      species.new(toolbox: @toolbox)
    end
  end
end
