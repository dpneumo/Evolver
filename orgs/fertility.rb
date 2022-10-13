# frozen_string_literal: true

module Fertility
# Initialize class >instance< variable fertility
  class << self
    def extended(base)
      base.send(:fertility=, base.send(:fertility_hash))
    end
  end

  def birth_probability(species:, color:, age:)
    Orgbase.send(:fertility, species:, color:, age:)
  end

private
  def fertility(species:, color:, age:)
    raise ArgumentError unless species && color && age
    return 0.00 unless (age.is_a? Integer) && age >= 0
    return 0.00 unless color.is_a? String
    @fertility[species][color][age]
  end

  def fertility=(value)
    @fertility = value
  end

  def fertility_hash
    Hash.new do |h, species|
      h[species] = Hash.new do |h1, color|
        h1[color] = Hash.new do |h2, age|
          h2[age] = constantize(species).fert_prob(color: color, age: age)
        end
      end
    end
  end
end

