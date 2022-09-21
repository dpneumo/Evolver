# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/coyote/coyote'
require_relative '../../storage/stat_store'

class StatStoreTest < Minitest::Test
  def setup
    @crit1 = Coyote.new(color: 'brown')
    @crit2 = Coyote.new(color: 'brown')
    @store = StatStore.new
  end

  def test_pop_counts_returns_a_hash
    assert_equal Hash, @store.pop_counts.class
  end

  def test_color_age_counts_returns_a_hash
    assert_equal Hash, @store.color_age_counts.class
  end

  def test_death_age_counts_returns_a_hash
    assert_equal Hash, @store.death_age_counts.class
  end

  def test_save_raw_data_returns_nil
    assert_nil @store.save_raw_data(creatures: [@crit1, @crit2], period: 3)
  end

  def test_build_death_stats_returns_nil
    assert_nil @store.build_death_stats(creature: @crit1)
  end

  def test_pop_counts_returns_population_by_period_by_species_as_hash
    @store.save_raw_data(creatures: [@crit1, @crit2], period: 1)
    @store.save_raw_data(creatures: [@crit2], period: 2)
    expected = { 1=>{"coyote"=>{:summed_ages=>0, :summed_count=>2}},
                 2=>{"coyote"=>{:summed_ages=>0, :summed_count=>1}} }
    assert_equal expected, @store.pop_counts
  end

  def test_death_age_counts_returns_age_of_death_data_for_species_by_color
    @crit1.age = 1; @crit2.age = 2
    @store.build_death_stats(creature: @crit1)
    @store.build_death_stats(creature: @crit2)
    expected = {"coyote"=>{"brown"=>{:summed_ages=>3, :summed_count=>2}}}
    assert_equal expected, @store.death_age_counts
  end

  def test_reports_save_failure
    @store.stub :save, false do 
      assert_output(/Critter/) {@store.save_raw_data(creatures: [@crit2], period: 2)}
    end
  end
end
