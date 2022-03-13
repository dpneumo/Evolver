require_relative 'utility_methods'

class LogisticTester
  include UtilityMethods

  def run(k: 1.0, limit: 1.0, x0: 0)
    h = {}
    0.upto(40) do |key|
      val = logistic(x: 2*key, k: k, limit: limit, x0: x0).round(4)
      puts "#{ key }:  #{ val }"
      h[key] = val
    end
    h.each {|_,val| puts "*"*(100*val) }
  end
end

lt = LogisticTester.new

lt.run(k: 0.15, x0: 40)

