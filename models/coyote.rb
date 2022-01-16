# frozen_string_literal: true

require_relative 'critter'
require_relative '../utilities/utilities'
require_relative '../utilities/critters/coyote/coyote_colors'
require_relative '../utilities/critters/coyote/coyote_fertility'

class Coyote < Critter
  extend CoyoteColors
  extend CoyoteFertility
  def initialize(toolbox:, color: 'black')
    super(toolbox: toolbox, color: color)
    @species = 'coyote'
    @color   = color
  end
end
