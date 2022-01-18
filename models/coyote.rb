# frozen_string_literal: true

require_relative 'orgbase'
require_relative '../utilities/utilities'
require_relative '../utilities/critters/coyote/coyote_colors'
require_relative '../utilities/critters/coyote/coyote_fertility'

class Coyote < Orgbase
  extend CoyoteColors
  extend CoyoteFertility
  def initialize(toolbox:, color: 'black')
    super(toolbox: toolbox, color: color)
    @species = 'coyote'
    @color   = color
  end
end
