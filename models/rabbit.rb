# frozen_string_literal: true

require_relative 'critter'

class Rabbit < Critter
  def initialize(toolbox:, color_id: 1)
    super
    @species = 'rabbit'
  end
end
