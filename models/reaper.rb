# frozen_string_literal: true
require_relative '../utilities/stats'

class Reaper
  include UtilityMethods

  def initialize(toolbox)
    @mortality = toolbox.mortality
    @statstore = toolbox.statstore
    @stats     = toolbox.stats
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
      loaded_coin = @mortality.probability(critter.age, critter.color_id)
      !flip loaded_coin
    end
end
