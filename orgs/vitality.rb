# frozen_string_literal: true

module Vitality
# Initialize class >instance< variable vitality
  class << self
    def extended(base)
      base.send(:vitality=, base.send(:vitality_hash))
    end
  end

  def survival_probability(species:, color:, age:)
    return 0.00 unless valid?(species:, color:, age:)
    vitality(species:, color:, age:)
  end

private
  def vitality(species:, color:, age:)
    @vitality[species][color][age]
  end

  def vitality=(value)
    @vitality = value
  end

  def vitality_hash
    Hash.new do |h, species|
      h[species] = Hash.new do |h1, color|
        h1[color] = Hash.new do |h2, age|
          h2[age] = vitality_dflt(species:, color:, age:)
        end
      end
    end
  end

  def vitality_dflt(species:, color:, age:)
    constantize(species).vit_prob(color: color, age: age)
  end

  def valid?(species:, color:, age:)
    raise ArgumentError unless species && color && age
    return false unless (color.is_a? String) && (age.is_a? Integer) && age >= 0
    true
  end    
end

