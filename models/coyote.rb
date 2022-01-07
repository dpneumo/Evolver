# frozen_string_literal: true

require_relative 'critter'

class Coyote < Critter
  def initialize(toolbox:, color_id: 1)
    super
    @species_name = 'coyote'
  end
end
