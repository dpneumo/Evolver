class SterileCritter
  def initialize(color: 'red'); @color = color; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 3.9; end
  def self.enctr_sizes_hash; Hash.new {|h,r| h[r] = 10 }; end
  def self.survival_probability(age:, color:); 0.0; end
  def self.birth_probability(species:, color:, age:); 0.0; end
  def self.vit_prob(color:, age:); 0.0; end
  def self.fert_prob(color:, age:) 0.0; end
  def self.mutations
    { 'blue'  => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'green' => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'red'   => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,}, }
  end
  def age; 2; end
  def health; 100; end
  def color; 'red'; end
  def species; "sterile_critter"; end
  def health=(health); @health = health; end
  def eats_prob; 0.5; end
  def eaten_vulnerability; 0.5; end
end

class FertileCritter
  def initialize(color: 'green'); @color = color; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 2.4; end
  def self.enctr_sizes_hash; Hash.new {|h,r| h[r] = 20 }; end
  def self.survival_probability(age:, color:); 1.0; end
  def self.birth_probability(species:, color:, age:); 1.0; end
  def self.vit_prob(color:, age:); 1.0; end
  def self.fert_prob(color:, age:)
    return 0.0 if color == 'What?' || age == 99
    1.0
  end
  def self.mutations
    { 'blue'  => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'green' => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'red'   => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,}, }
  end
  def age; 2; end
  def health; 100; end
  def color; 'red'; end
  def species; "fertile_critter"; end
  def health=(health); @health = health; end
  def eats_prob; 0.5; end
  def eaten_vulnerability; 0.5; end
end

class VitalCritter
  def initialize(color: 'green'); @color = color; end
  def self.max_health; 100; end
  def self.max_vigor; 100; end
  def self.enctr_scale; 2.4; end
  def self.enctr_sizes_hash; Hash.new {|h,r| h[r] = 20 }; end
  def self.survival_probability(age:, color:); 1.0; end
  def self.birth_probability(species:, color:, age:); 1.0; end
  def self.vit_prob(color:, age:)
    return 0 if color == 'What?' || age == 99
    0.5 
  end
  def self.fert_prob(color:, age:); 1.0; end
  def self.mutations
    { 'blue'  => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'green' => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,},
      'red'   => { 'red' => 0.20, 'green' => 0.30, 'blue' => 0.50,}, }
  end
  def age; 2; end
  def health; 100; end
  def color; 'red'; end
  def species; "vital_critter"; end
  def health=(health); @health = health; end
  def eats_prob; 0.5; end
  def eaten_vulnerability; 0.5; end
end

class MockCreatures
  attr_accessor :census
  attr_reader   :hunter_chain
  def initialize(foodchain:)
    @foodchain =    { 'sterile_critter' => {size: 2, prey: 'fertile_critter'},
                      'fertile_critter' => {size: 2, prey: 'none'} }
    @hunter_chain = { 'sterile_critter' => {size: 2, prey: 'fertile_critter'} }
    @census = {'sterile_critter' => [SterileCritter.new, SterileCritter.new],
               'fertile_critter' => [FertileCritter.new, FertileCritter.new] }
    nil
  end
  def age; end
  def ratios; {'sterile' => 3.4}; end
  def scale_factors; {'sterile' => 2}; end
end

class MockConsumer
  def encounters(creatures:);end
end

class MockFissioner
  def initialize; nil; end
  def reproduce(creatures:); nil;end
end

class MockStats
  def initialize(store:); nil; end
  def add_population_data(creatures:, period:); nil; end
  def add_death_data(creature:); nil; end
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
  def save_raw_data(creatures:, period:); nil; end
  def build_death_stats(creature:); nil; end
end

class MockPublisher
  def initialize(stats:); nil; end
  def publish; 'Stats'; end
end

class MockStatements
  def period_stats(stats); print nil; end
  def death_stats(stats); print nil; end
end  
