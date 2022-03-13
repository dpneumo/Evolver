# frozen_string_literal: true

require_relative 'requires'

runner = Runner.new

runner.run(periods: 5)
runner.show_stats
