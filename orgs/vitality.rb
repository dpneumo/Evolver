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
    sp_class = constantize(species)
    return 0.00 unless sp_class.colors.include? color
    parms = sp_class.vit_parms[color]
    vitality_prob(parms:, age:)
  end

  def vitality_prob(parms:, age:)
    slope = parms['slope']
    midpoint = parms['midpoint']
    1.00 - logistic(x: age, k:slope, x0:midpoint)
  end

  def valid?(species:, color:, age:)
    raise ArgumentError unless species && color && age
    return false unless (color.is_a? String) && (age.is_a? Integer) && age >= 0
    true
  end    
end

