# frozen_string_literal: true

require_relative 'id_generator'
require_relative 'stats'
require_relative 'stat_store'
require_relative 'resource'
require_relative 'vitality'
require_relative 'utilities'

class Toolbox
  attr_reader :id_generator, :stats, :statstore, :resource
  attr_reader :fertility, :vitality, :coyote_colors, :rabbit_colors, :critter_colors

  def initialize( id_generator: IDGenerator, stats: Stats, statstore: StatStore,
                  resource: Resource,
                  vitality: Vitality
                )
    @id_generator = id_generator.new
    @statstore    = statstore.new
    @stats        = stats.new(store: @statstore)
    @resource     = resource.new(stats: @stats)
    @vitality     = vitality.new(resource: @resource)
  end
end
