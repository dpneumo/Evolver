# frozen_string_literal: true

class Reaper
  def initialize(toolbox)
    @mortality = toolbox.mortality
    @stats = toolbox.stats
  end

  def survive(critters)
    critters.select { |critter| survives_this_period?(critter) }
  end

  private

  def survives_this_period?(critter)
    survives = will_survive?(critter)
    @stats.add_death_data(critter) unless survives
    survives
  end

  def will_survive?(critter)
    rand >= @mortality.probability(critter.age, critter.color_id)
  end
end
