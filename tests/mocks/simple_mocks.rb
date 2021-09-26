class MockFertility0
  def initialize(resource:); end
  def probability(age, color_id) = 0.0
end

class MockFertility1
  def initialize(resource:); end
  def probability(age, color_id) = 1.0
end

class MockMortality0
  def initialize(resource:); end
  def probability(age, color_id) = 0.0
end

class MockMortality1
  def initialize(resource:); end
  def probability(age, color_id) = 1.0
end

class MockIDGenerator1
  def initialize; end
  def next() = 1
end

class MockIDGenerator2
  def initialize; end
  def next() = 2
end

class MockColors
  def initialize; end
  def self.mutations
    { 0 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      1 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      2 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 }, }
  end
  def self.colors
    { 0 => 'test_color', 1 => 'red', 2 => 'green', }
  end
end

class MockResource
  def initialize(stats); end
  def level() = 1.0
end

class MockStats
  def initialize; end
  def add_population_data(critters, period); end
  def add_death_data(critter); end
end

class MockPublisher
  def initialize; end
  def publish(stats); 'Stats'; end
end

class MockToolbox
  attr_reader :id_generator, :stats, :resource, :colors
  attr_reader :fertility, :mortality

  def initialize( id_generator: MockIDGenerator1, stats: MockStats, resource: MockResource,
                  colors: MockColors, fertility: MockFertility1, mortality: MockMortality1 )
    @stats        = stats.new
    @id_generator = id_generator.new
    @resource     = resource.new(stats: @stats)
    @fertility    = fertility.new(resource: @resource)
    @mortality    = mortality.new(resource: @resource)
    @colors       = colors.new
  end
end
