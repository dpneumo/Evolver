# frozen_string_literal: true

module UtilityMethods
  def roll(loaded_die:)
    loaded_die.max_by { |_, weight| rand**(1.0 / weight) }.first
  end

  def flip(biased_coin:)
    rand < biased_coin
  end

  def mean(count:, weighted_value:)
    count.zero? ? 0 : weighted_value.fdiv(count)
  end
end
