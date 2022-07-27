# frozen_string_literal: true

module CarrotEncounters
  def population_encounters(ratio)
    # Users of the returned hash MUST insure keys are non-negative Integers
    @enctrs_by_ratio ||= encntr_hash
    @enctrs_by_ratio[ratio]
  end

  def encntr_hash
    Hash.new {|h, ratio| h[ratio] = Satiety }
  end
end
