# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/coyote/coyote_encounters'

class TCoy0; extend CoyoteEncounters; end
class TCoy1; extend CoyoteEncounters; end

class CoyoteEncountersTest < Minitest::Test
  def setup
    @satiety = TCoy1.satiety
    @next_ndx = TCoy1.encntr_hash.keys.max+1
  end

  def test_the_enctrs_by_ratio_cache_is_initially_nil()
    assert_nil TCoy0.instance_variable_get('@enctrs_by_ratio')
  end

  def test_1st_population_encounters_call_creates_and_caches_encntr_hash
    TCoy1.population_encounters(0)
    assert_equal Hash, TCoy1.instance_variable_get('@enctrs_by_ratio').class
  end

  def test_population_encounters_calls_do_not_change_encntr_hash_object_id
    TCoy1.population_encounters(0)
    pre_access_id = TCoy1.instance_variable_get('@enctrs_by_ratio').object_id
    TCoy1.population_encounters(@next_ndx)
    post_access_id = TCoy1.instance_variable_get('@enctrs_by_ratio').object_id
    assert_equal pre_access_id, post_access_id
  end 

  def test_satiety_returns_an_Integer
    assert_equal Integer, TCoy1.satiety.class
  end

  def test_encntr_hash_returns_a_Hash
    assert_equal Hash, TCoy1.encntr_hash.class
  end

  def test_pop_enctrs_for_ratio_eq_0_returns_0
    assert_equal 0, TCoy1.population_encounters(0)
  end

  def test_pop_enctrs_for_ratio_gt_last_index_returns_satiety
    assert_equal @satiety, TCoy1.population_encounters(@next_ndx)
  end
end