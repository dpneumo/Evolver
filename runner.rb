# frozen_string_literal: true

require_relative 'requires'
require 'pry'

Population.new(initial_pop_size: 10).run(periods: 10)
