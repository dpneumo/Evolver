# frozen_string_literal: true


# Usage: extend RabbitEncounters
module RabbitEncounters
  class << self
    def extended(base)
      base.enctr_sizes_hash = base.enctr_hash
    end
  end

  def satiety; 20; end
  def enctr_scale; 20.0; end
end
