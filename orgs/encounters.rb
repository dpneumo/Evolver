# frozen_string_literal: true

module Encounters
  class << self
    def extended(base)
      base.send(:encounters=, base.send(:encounters_hash))
    end
  end

  def encounter_count(species:, ratio:)
    encounters(species:, ratio:)
  end

private
  def encounters(species:, ratio:)
    @encounters[species][ratio]
  end

  def encounters=(value)
  	@encounters = value
  end

  def encounters_hash
    Hash.new do |h, species|
      h[species] = Hash.new do |h1, ratio|
        h1[ratio] = encounter_dflt(species:, ratio:)
      end
    end
  end
 
  def encounter_dflt(species:, ratio:)
    parms = constantize(species).enctr_parms
    encounter_est(parms:, ratio:)
  end

  def encounter_est(parms:, ratio:)
    k = parms['slope']
    x0 = parms['midpoint']
    limit = parms['satiety']
    logistic(x:ratio, k:, x0:, limit:).round.to_i
  end
end
