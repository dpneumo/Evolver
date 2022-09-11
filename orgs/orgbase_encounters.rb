# frozen_string_literal: true

# Usage: extend OrgbaseEncounters
module OrgbaseEncounters
  def satiety; 20; end
  def midpoint_ratio; 10; end
  def enctr_scale; 5.0; end

  def enctrs_count(ratio)
    return 0 if ratio.nil?
    @enctrs ||= enctr_hash
    @enctrs[ratio]
  end

  def enctr_hash
    # Users of the returned hash MUST insure keys are non-negative Integers
    hash = Hash.new {|h, ratio| h[ratio] = logistic_encounter(ratio) }
    hash[0]  = 0
    hash
  end

  def log2_encounter(ratio)
    log2curve(x:ratio, scale:enctr_scale).truncate
  end

  def logistic_encounter(ratio)
    logistic(x:ratio, x0:midpoint_ratio, limit:satiety).truncate
  end
end
