# frozen_string_literal: true

module CreaturesInterfaceTest
	def test_implements_census_accessor_interfaces
		assert_respond_to(@object, :census=)
		assert_equal 1, @object.method(:census=).arity
		assert_respond_to(@object, :census)
		assert_equal 0, @object.method(:census).arity
	end

	def test_implements_hunter_chain_reader_interface
		assert_respond_to(@object, :hunter_chain)
		assert_equal 0, @object.method(:hunter_chain).arity
	end

	def test_implements_populate_interface
		assert_respond_to(@object, :populate)
		assert_equal (1), @object.method(:populate).arity
	end

	def test_implements_age_interface
		assert_respond_to(@object, :age)
		assert_equal 0, @object.method(:age).arity
	end

	def test_implements_ratios_interface
		assert_respond_to(@object, :ratios)
		assert_equal 0, @object.method(:ratios).arity
	end
end