# frozen_string_literal: true

module Fertility
# Initialize class >instance< variable fertility
  class << self
    def extended(base)
      base.send(:fertility=, base.send(:fertility_hash))
    end
  end

  def birth_probability(species:, color:, age:)
    return 0.00 unless valid?(species:, color:, age:)
    fertility(species:, color:, age:)
  end

private
  def fertility(species:, color:, age:)
    @fertility[species][color][age]
  end

  def fertility=(value)
    @fertility = value
  end

  def fertility_hash
    Hash.new do |h, species|
      h[species] = Hash.new do |h1, color|
        h1[color] = Hash.new do |h2, age|
          h2[age] = fertility_dflt(species:, color:, age:)
        end
      end
    end
  end

  def fertility_dflt(species:, color:, age:)
    sp_class = constantize(species)
    return 0.00 unless sp_class.colors.include? color
    parms = sp_class.fert_parms[color]
    fertility_prob(parms:, age:)
  end

  def fertility_prob(parms:, age:)
    start = age - parms['maturation_start']
    plateau = parms['max_fertility']
    decline = 1 - Math.sqrt(parms['decline_rate']*(age - parms['decline_onset']).clamp(0..))
    [start, plateau, decline].min.clamp(0..1)
  end

  def valid?(species:, color:, age:)
    raise ArgumentError unless species && color && age
    return false unless (color.is_a? String) && (age.is_a? Integer) && age >= 0
    true
  end    
end
