# frozen_string_literal: true

module ReaperInterfaceTest
	def test_implements_survive_interface
		assert_respond_to(@object, :survive)
		assert_equal (1), @object.method(:survive).arity
	end
end