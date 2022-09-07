require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/benchmark'
require 'minitest/pride'
require 'pry'

require_relative '../support/utility_methods'
require_relative 'test_mocks'

VERBOSE = false
BACKTRACE = false
