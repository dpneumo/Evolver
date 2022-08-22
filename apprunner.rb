# frozen_string_literal: true

require_relative 'requires'

foodchain = {
              'coyote' => { size:  5, prey: 'rabbit' },
              'rabbit' => { size: 15, prey: 'carrot' },
              'carrot' => { size:  0, prey: 'none'   }
}

runner = Runner.new(foodchain: foodchain)

runner.run(periods: 10)
runner.show_stats
