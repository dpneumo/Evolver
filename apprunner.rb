# frozen_string_literal: true

require_relative 'requires'

foodchain = {'coyote' => {size: 1, prey: 'rabbit'},
             'rabbit' => {size: 2, prey: 'critter'},
             'critter' => {size: 0, prey: 'none'}
            }

runner = Runner.new(foodchain: foodchain)

runner.run(periods: 5)
runner.show_stats
