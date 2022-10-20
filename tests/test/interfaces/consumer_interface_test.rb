# frozen_string_literal: true

module ConsumerInterfaceTest
	def test_implements_encounters_interface
		assert_respond_to(@object, :encounters)
		assert_equal 1, @object.method(:encounters).arity
	end
end