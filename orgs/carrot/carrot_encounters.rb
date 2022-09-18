# frozen_string_literal: true

module CarrotEncounters
  class << self
    def extended(base)
      base.enctr_sizes_hash = base.enctr_hash
    end
  end

  def satiety; 20; end
  def enctr_scale; 4.7; end
end
