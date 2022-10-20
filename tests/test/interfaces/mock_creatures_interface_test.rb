# frozen_string_literal: true

module MockCreaturesInterfaceTest
	def test_implements_colors_interface
		assert_respond_to(@object.class, :colors)
		assert_equal (0), @object.class.method(:colors).arity
	end

	def test_implements_mutations_interface
		assert_respond_to(@object.class, :mutations)
		assert_equal (0), @object.class.method(:mutations).arity
	end
end