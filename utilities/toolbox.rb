# frozen_string_literal: true

require_relative 'id_generator'
require_relative 'stats'
require_relative 'stat_store'
require_relative 'resource'
require_relative 'colors'
require_relative 'fertility'
require_relative 'mortality'
require_relative 'vitality'

class Toolbox
  attr_reader :id_generator, :stats, :statstore, :resource, :colors
  attr_reader :fertility, :mortality, :vitality

  def initialize( id_generator: IDGenerator, stats: Stats, statstore: StatStore, resource: Resource,
                  colors: Colors, fertility: Fertility, mortality: Mortality, vitality: Vitality )
    @id_generator = id_generator.new
    @statstore    = statstore.new
    @stats        = stats.new(store: @statstore)
    @resource     = resource.new(stats: @stats)
    @colors       = colors.new
    @fertility    = fertility.new(resource: @resource)
    @mortality    = mortality.new(resource: @resource)
    @vitality     = vitality.new(resource: @resource)
  end
end
