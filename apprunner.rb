# frozen_string_literal: true

require_relative 'requires'

foodchain = {'coyote' => {size: 10, prey: 'rabbit'},
             'rabbit' => {size: 20, prey: 'critter'},
             'critter' => {size: 0, prey: 'none'}
            }
baselink = 'critter'

runner = Runner.new(foodchain: foodchain, baselink: baselink)

runner.run(periods: 20)
runner.show_stats
