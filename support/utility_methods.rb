# frozen_string_literal: true

module UtilityMethods
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

  def log2curve(x:, scale: 1)
    scale*Math.log2(x)
  end

  def logistic(x:, x0:0.0, k:1.0, limit:1.0)
    denom = 1.0 + Math::E**(-k*(x-x0))
    limit/denom
  end

  def suppress_output
    # Usage: suppress_output { a_noisy_method }
    original_stdout, original_stderr = $stdout.clone, $stderr.clone
    $stderr.reopen File.new('/dev/null', 'w')
    $stdout.reopen File.new('/dev/null', 'w')
    yield
  ensure
    $stdout.reopen original_stdout
    $stderr.reopen original_stderr
  end
end
