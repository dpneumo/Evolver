# frozen_string_literal: true

require_relative 'id_generator'
require_relative 'stats'
require_relative 'resource'
require_relative 'colors'
require_relative 'fertility'
require_relative 'mortality'

class Toolbox
  attr_reader :id_generator, :stats, :resource, :colors
  attr_reader :fertility, :mortality

  def initialize( id_generator: IDGenerator, stats: Stats, resource: Resource,
                  colors: Colors, fertility: Fertility, mortality: Mortality )
    @stats        = stats.new
    @id_generator = id_generator.new
    @resource     = resource.new
    @colors       = colors.new
    @fertility    = fertility.new
    @mortality    = mortality.new
  end
end
