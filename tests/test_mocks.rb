class MockCritter0
  def self.survival_probability(age:, color:); 0.0; end
  def self.birth_probability(age:, color:); 0.0; end
  def age; 2; end
  def color; 'red'; end
  def species; "mockcrit"; end
end

class MockCritter1
  def self.survival_probability(age:, color:); 1.0; end
  def self.birth_probability(age:, color:); 1.0; end
  def age; 2; end
  def color; 'red'; end
  def species; "mockcrit"; end
end

class MockPopulator
  def initialize(toolbox:); end
  def populate(size:, species:); []; end
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
  attr_reader :stats, :statstore

  def initialize( stats: MockStats, statstore: MockStatStore )
    @statstore    = statstore.new
    @stats        = stats.new(statstore: @statstore)
  end
end
