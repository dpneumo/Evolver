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
  def self.mutations
    { 0 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      1 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      2 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 }, }
  end
  def self.colors
    { 0 => 'test_color', 1 => 'red', 2 => 'green', }
  end
end

class MockPopulator
  def initialize(toolbox); end
  def populate(size); end
end

class MockResource
  def initialize(stats); end
  def level() = 1.0
end

class MockStats
  def initialize(statstore:); end
  def add_population_data(critters, period); end
  def add_death_data(critter); end
  def pop_counts()       = { 1 => 10, 2 => 20 }
  def death_counts()     = { 1 => 10, 2 => 20 }
  def death_age_counts() = { 1 => 40, 2 => 100 }
end

class MockStatStore
  attr_reader :pop_counts; :death_counts; :death_age_counts
  def initialize; end
  def save_raw_data(critters, period); end
  def build_color_stats(period); end
  def build_population_stats(period); end
  def build_death_stats(critter); end
end

class MockPublisher
  def initialize(toolbox:); end
  def publish; 'Stats'; end
end

class MockToolbox
  attr_reader :id_generator, :stats, :statstore, :resource, :colors
  attr_reader :fertility, :mortality

  def initialize( id_generator: MockIDGenerator1, stats: MockStats, statstore: MockStatStore, resource: MockResource,
                  colors: MockColors, fertility: MockFertility1, mortality: MockMortality1 )
    @id_generator = id_generator.new
    @statstore    = statstore.new
    @stats        = stats.new(statstore: @statstore)
    @resource     = resource.new(stats: @stats)
    @fertility    = fertility.new(resource: @resource)
    @mortality    = mortality.new(resource: @resource)
    @colors       = colors.new
  end
end
