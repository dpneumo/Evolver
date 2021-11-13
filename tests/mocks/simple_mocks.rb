class MockFertility
  def initialize(resource:); end
end

class MockFertility0 < MockFertility
  def probability(age:, color_id:) = 0.0
end

class MockFertility1 < MockFertility
  def probability(age:, color_id:) = 1.0
end

class MockMortality
  def initialize(resource:); end
end

class MockMortality0 < MockMortality
  def probability(age:, color_id:) = 0.0
end

class MockMortality1 < MockMortality
  def probability(age:, color_id:) = 1.0
end

class MockIDGenerator
  def initialize; end
end

class MockIDGenerator1 < MockIDGenerator
  def next() = 1
end

class MockIDGenerator2 < MockIDGenerator
  def next() = 2
end

class MockColors
  attr_reader :mutations, :colors
  def initialize
    @mutations = {
      0 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      1 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      2 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
    }
    @colors = { 0 => 'test_color', 1 => 'red', 2 => 'green', }
  end
end

class MockPopulator
  def initialize(toolbox:); end
  def populate(size:, species:); []; end
end

class MockResource
  def initialize(stats:); end
  def level() = 1.0
end

class MockStats
  def initialize(statstore:); end
  def add_population_data(critters:, period:); end
  def add_death_data(critter:); end
  def pop_counts
    { 1 => { weighted_age: 2, count: 2 },
      2 => { weighted_age: 4, count: 3 } }
  end
  def death_age_counts(color_id:)
    death_stats = { 0 => { weighted_age: 0,   count: 0 },
                    1 => { weighted_age: 40,  count: 10 },
                    2 => { weighted_age: 100, count: 20 } }
    death_stats[color_id]
  end
  def dac_all
    {count: 30, weighted_age: 140}
  end
end

class MockStatStore
  attr_reader :pop_counts, :death_age_counts
  def initialize
    @pop_counts       = { 1 => { weighted_age: 2, count: 2 },
                          2 => { weighted_age: 4, count: 3 } }
    @death_age_counts = { 1 => { weighted_age: 40,  count: 10 },
                          2 => { weighted_age: 100, count: 20 } }
  end
  def save_raw_data(critters:, period:); end
  def build_color_stats(period:); end
  def build_population_stats(period:); end
  def build_death_stats(critter:); end
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
