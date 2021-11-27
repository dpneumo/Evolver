# frozen_string_literal: true

require_relative '../tests/mocks/simple_mocks'
require_relative '../utilities/stats'
require_relative 'test_helper'

class StatsTest < Minitest::Test
  def setup
    @stats = Stats.new(store: MockStatStore.new)
  end

  def test_can_add_population_data
    assert_nil @stats.add_population_data(critters: ['C1', 'C2'], period: 3)
  end

  def test_can_add_death_data
    assert_nil @stats.add_death_data(critter: 'C1')
  end

  def test_retrieves_pop_counts_from_store
    expected = { 1 => { summed_ages: 2, count: 2 },
                 2 => { summed_ages: 4, count: 3 } }
    assert_equal expected, @stats.pop_counts
  end

  def test_retrieves_death_age_counts_from_store
    expected = { summed_ages: 40,  count: 10 }
    assert_equal expected, @stats.death_age_counts(color_id: 1)
  end

  def test_retrieves_dac_all_from_store
    expected = { count: 30, summed_ages: 140 }
    assert_equal expected, @stats.dac_all
  end
end
