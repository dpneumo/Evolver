# frozen_string_literal: true

module UtilityMethods
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def flip(biased_coin:)
    Random.rand < biased_coin
  end

  def roll(loaded_die:)
    loaded_die.max_by { |_, weight| Random.rand**(1.0 / weight) }.first
  end

  def random_ndxs(collection, ndx_count)
    ndx_count.times.map {|i| Random.rand(0..(collection.size-1))}
  end

  def mean(count:, sum:)
    return 0.0 if count.zero?
    sum.fdiv(count)
  end

  def constantize(my_str)
    Object.const_get(my_str.split('_').map(&:capitalize).join)
  end

  # Usage: result = silence_streams(STDERR, STDOUT) { a_noisy_method }
  def silence_streams(*streams)
    on_hold = streams.collect { |stream| stream.dup }
    streams.each do |stream|
      stream.reopen(RUBY_PLATFORM =~ /mswin/ ? 'NUL:' : '/dev/null')
      stream.sync = true
    end
    retval = yield
  ensure
    streams.each_with_index do |stream, i|
      stream.reopen(on_hold[i])
    end
    retval
  end

  module ClassMethods
    def log2curve(x:, scale: 1)
      scale*Math.log2(x)
    end

    # x0: midpoint, k: steepness, limit: maximum
    def logistic(x:, x0:0.0, k:1.0, limit:1.0)
      denom = 1.0 + Math::E**(-k*(x-x0))
      limit/denom
    end

    def sinecurve(x:, x0:0.0, period:1.0, scale:1.0)
      scale*Math::sin((x-x0)/period)
    end

    # Evolved from Rails
    #   activesupport/lib/active_support/core_ext/class/subclasses.rb
    def descendants
      ObjectSpace.each_object(singleton_class).reduce([]) do |des, k|
        des.unshift k unless k.singleton_class? || k == self
        des
      end
    end
  end
end
