# frozen_string_literal: true

require_relative 'requires'

runner = Runner.new(initial_pop_size: 10)

runner.run(periods: 10)
runner.show_stats
