# frozen_string_literal: true
require_relative '../utilities/stats'

class Reaper
  include UtilityMethods

  def initialize(toolbox:)
    @mortality = toolbox.mortality
    @statstore = toolbox.statstore
    @stats     = toolbox.stats
  end

  def survive(critters:)
    critters.reject { |critter| dies_this_period?(critter) }
  end

  private
    def dies_this_period?(critter)
      dies = will_die?(critter)
      @stats.add_death_data(critter: critter) if dies
      dies
    end

    def will_die?(critter)
      flip(biased_coin: biased_coin(critter))
    end

    def biased_coin(critter)
      @mortality.probability(age: critter.age, color_id: critter.color_id)
    end
end
