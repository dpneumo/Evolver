# frozen_string_literal: true

require_relative '../orgbase'
require_relative 'coyote_colors'
require_relative 'coyote_fertility'
require_relative 'coyote_vitality'

class Coyote < Orgbase
  extend CoyoteColors
  extend CoyoteFertility
  extend CoyoteVitality
  def initialize(color: 'black')
    super(color: color)
    @species = 'coyote'
  end
end
