# frozen_string_literal: true

module RunnerInterfaceTest
	def test_implements_run_interface
		assert_respond_to(@object, :run)
		assert_equal (-1), @object.method(:run).arity
	end

	def test_implements_show_stats_interface
		assert_respond_to(@object, :show_stats)
		assert_equal 0, @object.method(:show_stats).arity
	end
end