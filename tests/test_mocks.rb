class MockCritter0
  def initialize(color: 'red'); @color = color; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 3.9; end
  def self.survival_probability(age:, color:); 0.0; end
  def self.birth_probability(age:, color:); 0.0; end
  def self.mutations
    { 'blue'  => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'green' => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'red'   => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,}, }
  end
  def age; 2; end
  def health; 100; end
  def color; 'red'; end
  def species; "mockcrit"; end
  def health=(health); @health = health; end
  def eats_prob; 0.5; end
  def eaten_prob; 0.5; end
end

class MockCritter1
  def initialize(color: 'green'); @color = color; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 2.4; end
  def self.survival_probability(age:, color:); 1.0; end
  def self.birth_probability(age:, color:); 1.0; end
  def self.mutations
    { 'blue'  => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'green' => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'red'   => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,}, }
  end
  def age; 2; end
  def health; 100; end
  def color; 'red'; end
  def species; "mockcrit"; end
  def health=(health); @health = health; end
  def eats_prob; 0.5; end
  def eaten_prob; 0.5; end
end

class MockCreatures
  attr_accessor :census
  attr_reader   :foodchain, :baselink
  def initialize(foodchain:, baselink:)
    @census = {'sterile' => [MockCritter0.new, MockCritter0.new],
               'fertile' => [MockCritter1.new, MockCritter1.new] }
    @foodchain = { 'sterile' => {size: 2, prey: 'fertile'},
                   'fertile' => {size: 2, prey: 'none'} }
    nil
  end
  def age; end
  def ratios; {'sterile' => 3.4}; end
  def scales; {'sterile' => 2}; end
end

class MockConsumer
  def encounters(creatures:);end
end

class MockStats
  def initialize(store:); nil; end
  def add_population_data(creatures:, period:); nil; end
  def add_death_data(critter:); nil; end
  def pop_counts
    { 1 => {coyote: { summed_ages: 2, summed_count: 2 }},
      2 => {coyote: { summed_ages: 4, summed_count: 3 }} }
  end
  def species_count(period:, species:)
    return 10 if species == 'coyote'
    return 40 if species == 'rabbit'
    200
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
  attr_reader :pop_counts, :color_age_counts, :death_age_counts
  def initialize
    @data = {}
    @color_age_counts = {}
    @pop_counts       = { 1 => {coyote: { summed_ages: 2, summed_count: 2 }},
                          2 => {coyote: { summed_ages: 4, summed_count: 3 }} }
    @death_age_counts = { coyote: { 'red' => { summed_ages: 40,  summed_count: 10 },
                                    'blue' => { summed_ages: 100, summed_count: 20 } },
                          rabbit: { 'black' => { summed_ages: 40,  summed_count: 10 },
                                    'white' => { summed_ages: 100, summed_count: 20 } } }
    nil
  end
  def save_raw_data(critters:, period:); nil; end
  def build_death_stats(critter:); nil; end
end

class MockPublisher
  def initialize(stats:); nil; end
  def publish; 'Stats'; end
end

class MockStatements
  def period_stats(stats); print nil; end
  def death_stats(stats); print nil; end
end  
