# frozen_string_literal: true

require_relative '../tests/mocks/simple_mocks'
require_relative '../utilities/stat_store'
require_relative 'test_helper'

class StatStoreTest < Minitest::Test
  def setup
    tbx = MockToolbox.new
    @crit1 = Critter.new(toolbox: tbx, age: 1, color_id: 1)
    @crit2 = Critter.new(toolbox: tbx, age: 2, color_id: 2)
    @store = StatStore.new
  end

  def test_pop_counts_returns_a_hash
    assert_equal Hash, @store.pop_counts.class
  end

  def test_death_age_counts_returns_a_hash
    assert_equal Hash, @store.death_age_counts.class
  end

  def test_save_raw_data_returns_nil
    assert_nil @store.save_raw_data(critters: [@crit1, @crit2], period: 3)
  end

  def test_build_color_stats_returns_nil
    assert_nil @store.build_color_stats(period: 3)
  end

  def test_build_population_stats_returns_nil
    assert_nil @store.build_population_stats(period: 3)
  end

  def test_add_critter_to_death_stats
    assert_nil @store.build_death_stats(critter: @crit1)
  end

  def test_pop_counts_returns_population_by_period_as_hash
    @store.save_raw_data(critters: [@crit1, @crit2], period: 1)
    @store.build_color_stats(period: 1)
    @store.build_population_stats(period: 1)
    @store.save_raw_data(critters: [@crit2], period: 2)
    @store.build_color_stats(period: 2)
    @store.build_population_stats(period: 2)
    expected = {1=>{:summed_ages=>3, :count=>2}, 2=>{:summed_ages=>2, :count=>1}}
    assert_equal expected, @store.pop_counts
  end

  def test_death_age_counts_returns_age_of_death_data_by_color
    @store.build_death_stats(critter: @crit1)
    @store.build_death_stats(critter: @crit2)
    expected = {1=>{:summed_ages=>1, :count=>1}, 2=>{:summed_ages=>2, :count=>1}}
    assert_equal expected, @store.death_age_counts
  end
end
