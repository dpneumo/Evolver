require_relative 'utility_methods'

class LogisticTester
  include UtilityMethods

  def run(k: 1.0, limit: 1, x0: 0)
    (-16..16).each do |i|
      puts logistic(x: i, k: k, limit: limit, x0: x0)
    end
  end
end

lt = LogisticTester.new

lt.run(k: 0.25)
