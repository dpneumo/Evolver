# frozen_string_literal: true

require_relative '../storage/stats'

class Reaper
  include UtilityMethods

  def initialize(toolbox:)
    @statstore = toolbox.statstore
    @stats     = toolbox.stats
  end

  def survive(critters:)
    critters.select { |critter| survives_this_period?(critter) }
  end

  private
    def survives_this_period?(critter)
      lives = will_live?(critter)
      @stats.add_death_data(critter: critter) unless lives
      lives
    end

    def will_live?(critter)
      flip(biased_coin: vitality_biased_coin(critter))
    end

    def vitality_biased_coin(critter)
    critter.class.survival_probability(age: critter.age, color: critter.color)
    end
end
