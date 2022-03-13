# frozen_string_literal: true

require_relative '../test_helper'

class UtilityMethodsBenchmark < Minitest::Benchmark
  include UtilityMethods

  class MyClass
    include UtilityMethods
  end

  describe "Utility Methods Benchmark" do
    puts "Utility Methods\t   10_000\t  100_000"

    before do
      @myhash = {}; 1.upto(30) {|j| @myhash[j] = 0.001*j }
      @die = { 'test_color' => 0.00,
               'black' =>      0.70,
               'brown' =>      0.20,
               'gray' =>       0.05,
               'white' =>      0.05, }
      @arry = []; 0.upto(10000) {|j| @arry[j] = 2*j }

      @obj = MyClass.new
     end

    bench_range { [10_000, 100_000] }

    bench_performance_linear "logistic" do |n|
      n.times { 1.upto(30) {|j| @obj.logistic(x: j) } }
    end

    bench_performance_linear "hash" do |n|
      n.times { 1.upto(30) {|j| @myhash[j] } }
    end

    bench_performance_linear "roll" do |n|
      n.times { @obj.roll(loaded_die: @die) }
    end

    bench_performance_linear "flip" do |n|
      n.times { @obj.flip(biased_coin: 0.7) }
    end

    bench_performance_linear "mean" do |n|
      n.times { @obj.mean(count:123, sum:9876) }
    end

    bench_performance_linear "log2crve" do |n|
      n.times { 1.upto(30) {|j| @obj.log2curve(x:j, scale:6.7) } }
    end

    bench_performance_linear "rnd_ndxs" do |n|
      n.times { @obj.random_ndxs(@arry, 20) }
    end
  end
end
