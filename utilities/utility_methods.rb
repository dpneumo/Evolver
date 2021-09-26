# frozen_string_literal: true

module UtilityMethods
  def roll(loaded_die)
    loaded_die.max_by { |_, weight| rand**(1.0 / weight) }.first
  end

  def flip(loaded_coin)
    rand < loaded_coin
  end

  def mean(total, weighted_value)
    total.zero? ? 0 : weighted_value.fdiv(total)
  end
end
