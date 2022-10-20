# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../test/interfaces/creatures_interface_test'
require_relative '../../actors/creatures'
require_relative '../../orgs/coyote/coyote'
require_relative '../../orgs/rabbit/rabbit'

class CreaturesTest < Minitest::Test
  include CreaturesInterfaceTest
  def setup
    @foodchain = { 'coyote' =>        {size: 1, prey: 'rabbit'},
                   'rabbit' =>        {size: 2, prey: 'fertile_critter'},
                   'fertile_critter' => {size: 0, prey: 'none'} }
    @creatures = @object = Creatures.new(foodchain: @foodchain)
  end

  def test_raises_when_base_species_missing_from_foodchain
    @foodchain['fertile_critter'][:prey] = 'another_critter'
    assert_raises ArgumentError do
      Creatures.new(foodchain: @foodchain)
    end
  end

  def test_can_populate_with_4_mock_critters
    mocks = @creatures.populate(size: 4, species: 'sterile_critter')
    assert_equal 4, mocks.size
  end

  def test_can_age_all_species_members
    expected = {"coyote"=>[0], "rabbit"=>[0, 0], "fertile_critter"=>[]}
    assert_equal expected, creature_ages(@creatures)

    @creatures.age
    expected = {"coyote"=>[1], "rabbit"=>[1, 1], "fertile_critter"=>[]}
    assert_equal expected, creature_ages(@creatures)
  end

  def test_can_get_ratio_of_prey_to_hunter
    expected = {"coyote"=>2.0, "rabbit"=>1.0, "fertile_critter"=>20.0}
    assert_equal expected, @creatures.ratios
  end

  def test_can_get_scale_factors_for_hunter_prey_encounters
    expected = {"coyote"=>4.7, "rabbit"=>20, "fertile_critter"=>2.4}
    assert_equal expected, @creatures.scale_factors
  end

  private
    def creature_ages(creatures)
      creatures.census.reduce({}) do |h, (species, list)|
        crtr_ages = list.map {|crtr| crtr.age }
        h.update(species => crtr_ages)
      end
    end
end
