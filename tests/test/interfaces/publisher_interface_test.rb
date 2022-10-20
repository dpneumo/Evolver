# frozen_string_literal: true

module PublisherInterfaceTest
	def test_implements_publish_interface
		assert_respond_to(@object, :publish)
		assert_equal (0), @object.method(:publish).arity
	end
end