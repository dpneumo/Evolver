# frozen_string_literal: true

require_relative 'requires'
require 'pry'

population = Population.new(initial_pop_size: 10)

population.run(periods: 10)
population.show_stats
