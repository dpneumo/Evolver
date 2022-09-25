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
    
    private
      def logistic_encounter(ratio)
        logistic(x:ratio, x0:ratio_midpoint, limit:satiety).truncate
      end

      def log2_encounter(ratio)
        log2curve(x:ratio, scale:enctr_scale).truncate
      end
  end
end
