# frozen_string_literal: true

# Usage: extend OrgbaseEncounters
module OrgbaseEncounters
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    def satiety; 20; end
    def ratio_midpoint; 10.0; end
    def enctr_scale; 5.0; end

    def enctr_sizes_hash
      @enctr_sizes_hash
    end

    def enctr_sizes_hash=(value)
      @enctr_sizes_hash = value
    end

    def enctr_hash
      # Users of the returned hash MUST insure keys are non-negative Integers
      Hash.new {|h, ratio| h[ratio] = logistic_encounter(ratio) }
      #Hash.new {|h, ratio| h[ratio] = log2_encounter(ratio) }
    end
    
    private
      def logistic_encounter(ratio)
        logistic(x:ratio, x0:ratio_midpoint, limit:satiety).truncate
      end

      def log2_encounter(ratio)
        log2curve(x:ratio, scale:enctr_scale).truncate
      end
  end
end
