# frozen_string_literal: true

class IDGenerator
  def initialize
    @generator = Fiber.new do
      id = 1
      loop do
        Fiber.yield id
        id += 1
      end
    end
    nil
  end

  def next
    @generator.resume
  end
end
