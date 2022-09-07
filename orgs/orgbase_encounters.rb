# frozen_string_literal: true

# Usage: extend OrgbaseEncounters
module OrgbaseEncounters
  def satiety; 20; end

  def encntr_hash
    hash = Hash.new {|h, ratio| h[ratio] = satiety }
    hash[0]  = 0
    hash[1]  = 0
    hash[2]  = 1
    hash[3]  = 1
    hash[4]  = 2
    hash[5]  = 2
    hash[6]  = 3
    hash[7]  = 4
    hash[8]  = 6
    hash[9]  = 8
    hash[10] = 10
    hash[11] = 12
    hash[12] = 14
    hash[13] = 16
    hash[14] = 17
    hash[15] = 18
    hash[16] = 18
    hash[17] = 19
    hash[18] = 19
    hash
  end

  def population_encounters(ratio)
    # Users of the returned hash MUST insure keys are non-negative Integers
    @enctrs_by_ratio ||= encntr_hash
    @enctrs_by_ratio[ratio]
  end
end
