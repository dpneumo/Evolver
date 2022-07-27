# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../actors/creatures'
require_relative '../../orgs/coyote/coyote'
require_relative '../../orgs/rabbit/rabbit'

class CreaturesTest < Minitest::Test

  def setup
    foodchain = { 'coyote' => {size: 1, prey: 'rabbit'},
                  'rabbit' => {size: 2, prey: 'mock_critter1'},
                  'mock_critter1' => {size: 0, prey: 'none'} }
    @creatures = Creatures.new(foodchain: foodchain, baselink: 'none')
  end

  def test_can_populate_with_4_mock_critters
    mocks = @creatures.populate(size: 4, species: 'mock_critter_0')
    assert_equal 4, mocks.size
  end

  def test_can_age_all_species_members
    expected = {"coyote"=>[0], "rabbit"=>[0, 0], "mock_critter1"=>[]}
    assert_equal expected, creature_ages(@creatures)

    @creatures.age
    expected = {"coyote"=>[1], "rabbit"=>[1, 1], "mock_critter1"=>[]}
    assert_equal expected, creature_ages(@creatures)
  end

  def test_can_get_ratio_of_prey_to_hunter
    expected = {"coyote"=>2.0, "rabbit"=>1.0, "mock_critter1"=>20.0}
    assert_equal expected, @creatures.ratios
  end

  def test_can_get_scale_factor_for_hunter_prey_encounter
    expected = {"coyote"=>4.7, "rabbit"=>20, "mock_critter1"=>2.4}
    assert_equal expected, @creatures.scales
  end

  def creature_ages(creatures)
    creatures.census.reduce({}) do |h, (species, list)|
      crtr_ages = list.map {|crtr| crtr.age }
      h.update(species => crtr_ages)
    end
  end
end
