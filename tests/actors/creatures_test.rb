# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../actors/creatures'
require_relative '../../orgs/coyote/coyote'
require_relative '../../orgs/rabbit/rabbit'

class CreaturesTest < Minitest::Test

  def setup
    @creatures = Creatures.new
  end

  def test_can_populate_with_4_mock_critters
    mocks = @creatures.populate(size: 4, species: MockCritter0)
    assert_equal 4, mocks.size
  end

  def test_can_age_all_species_members
    expected = {"coyotes"=>[0], "rabbits"=>[0, 0]}
    assert_equal expected, creature_ages(@creatures)

    @creatures.age
    expected = {"coyotes"=>[1], "rabbits"=>[1, 1]}
    assert_equal expected, creature_ages(@creatures)
  end

  def test_can_get_ratio_of_hunter_to_prey
    expected = {"coyotes"=>2.0}
    assert_equal expected, @creatures.ratios
  end

  def test_can_get_scale_factor_for_hunter_prey_encounter
    expected = {"coyotes"=>4.7}
    assert_equal expected, @creatures.scales
  end

  def creature_ages(creatures)
    creatures.census.reduce({}) do |h, (species, list)|
      crtr_ages = list.map {|crtr| crtr.age }
      h.update(species => crtr_ages)
    end
  end
end
