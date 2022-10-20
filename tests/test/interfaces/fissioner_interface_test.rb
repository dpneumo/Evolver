# frozen_string_literal: true

module FissionerInterfaceTest
	def test_implements_reproduce_interface
		assert_respond_to(@object, :reproduce)
		assert_equal (1), @object.method(:reproduce).arity
	end
end