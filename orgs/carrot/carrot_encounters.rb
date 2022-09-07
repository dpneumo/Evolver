# frozen_string_literal: true

module CarrotEncounters
  def satiety; 20; end

  def encntr_hash
    hash = Hash.new {|h, ratio| h[ratio] = satiety }
    hash[0]  = 0
    hash
  end

  def population_encounters(ratio)
    # Users of the returned hash MUST insure keys are non-negative Integers
    @enctrs_by_ratio ||= encntr_hash
    @enctrs_by_ratio[ratio]
  end
end
