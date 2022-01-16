class MockOrange
  attr_reader :name, :mutations
  def initialize
    @name      = 'orange'
    @mutations = {
      'orange' => 0.30,
      'black' =>  0.70,
      }
  end
end

module MockCritterColors
  def colors
    { 'orange' => MockOrange.new}
  end
end

module MockCritterFertility
  def probability(age:, color:)
    age.zero? ? 0.0 : 1.0
  end
end

class MockCritter
  extend MockCritterColors
  extend MockCritterFertility
  attr_reader :age, :health, :species, :color

  def initialize(toolbox:, color: 'red')
    @age        = 0
    @health     = 1.0
    @species = 'critter'
    @color = 'red'
  end

  def age=(age)
    @age = age
  end

  def health=(health)
    puts "MockCritter#health= not implemented!"
  end
end

class MockFertility
  def initialize(resource:); end
end

class MockFertility0 < MockFertility
  def probability(age:, color:) = 0.0
end

class MockFertility1 < MockFertility
  def probability(age:, color:) = 1.0
end

class MockVitality
  def initialize(resource:); end
end

class MockVitality0 < MockVitality
  def probability(age:, color:) = 1.0
end

class MockVitality1 < MockVitality
  def probability(age:, color:) = 0.0
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
  attr_reader :mutations, :color_names
  def initialize
    @mutations = {
      0 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      1 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
      2 => { 0 => 1.00, 1 => 0.00, 2 => 0.00 },
    }
    @color_names = { 0 => 'test_color', 1 => 'red', 2 => 'green', }
  end
end

class MockPopulator
  def initialize(toolbox:); end
  def populate(size:, species:); []; end
end

class MockResource1
  def initialize(stats:); end
  def level() = 1.0
end

class MockResource9
  def initialize(stats:); end
  def level() = 9.0
end

class MockStats
  def initialize(statstore:); end
  def add_population_data(critters:, period:); end
  def add_death_data(critter:); end
  def pop_counts
    { 1 => {coyote: { summed_ages: 2, summed_count: 2 }},
      2 => {coyote: { summed_ages: 4, summed_count: 3 }} }
  end
  def death_age_counts(species:, color:)
    death_stats = { coyote: { 0 => { summed_ages: 0,   summed_count: 0 },
                              1 => { summed_ages: 40,  summed_count: 10 },
                              2 => { summed_ages: 100, summed_count: 20 } } }
    death_stats[species][color]
  end
  def dac_all
    { coyote: { summed_count: 30, summed_ages: 140 } }
  end
end

class MockStatStore
  attr_reader :pop_counts, :death_age_counts
  def initialize
    @pop_counts       = { 1 => {coyote: { summed_ages: 2, summed_count: 2 }},
                          2 => {coyote: { summed_ages: 4, summed_count: 3 }} }
    @death_age_counts = { coyote: { 1 => { summed_ages: 40,  summed_count: 10 },
                                    2 => { summed_ages: 100, summed_count: 20 } },
                          rabbit: { 1 => { summed_ages: 40,  summed_count: 10 },
                                    2 => { summed_ages: 100, summed_count: 20 } } }
  end
  def save_raw_data(critters:, period:); end
  def build_death_stats(critter:); end
end

class MockPublisher
  def initialize(toolbox:); end
  def publish; 'Stats'; end
end

class MockToolbox
  attr_reader :id_generator, :stats, :statstore, :resource
  attr_reader :fertility, :vitality, :coyote_colors, :rabbit_colors, :critter_colors

  def initialize( id_generator: MockIDGenerator1, stats: MockStats, statstore: MockStatStore,
                  resource: MockResource1, colors: MockColors,
                  vitality: MockVitality1
                )
    @id_generator = id_generator.new
    @statstore    = statstore.new
    @stats        = stats.new(statstore: @statstore)
    @resource     = resource.new(stats: @stats)
    @vitality     = vitality.new(resource: @resource)
  end
end
