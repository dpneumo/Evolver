# frozen_string_literal: true

require_relative '../storage/stats'
require_relative '../storage/stat_store'

class Toolbox
  attr_reader :stats, :statstore

  def initialize( stats: Stats, statstore: StatStore)
    @statstore    = statstore.new
    @stats        = stats.new(store: @statstore)
  end
end
