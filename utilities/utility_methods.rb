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

  def logistic(x:, x0: 0.0, k: 1.0, limit: 1)
    denom = 1 + Math::E**(-k*(x-x0))
    limit/denom
  end
end
