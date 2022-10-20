# frozen_string_literal: true

module OrgbaseInterfaceTest
	# Instance interface tests
	def test_implements_instance_accessor_interfaces
		assert_respond_to(@object, :species)
		assert_equal 0, @object.method(:species).arity

		assert_respond_to(@object, :satiety)
		assert_equal 0, @object.method(:satiety).arity

		assert_respond_to(@object, :color)
		assert_equal 0, @object.method(:color).arity

		assert_respond_to(@object, :age)
		assert_equal 0, @object.method(:age).arity

		assert_respond_to(@object, :health)
		assert_equal 0, @object.method(:health).arity
		
		assert_respond_to(@object, :vigor)
		assert_equal 0, @object.method(:vigor).arity
	end

	def test_implements_set_age_interface
		assert_respond_to(@object, :age=)
		assert_equal 1, @object.method(:age=).arity
	end

	def test_implements_set_health_interface
		assert_respond_to(@object, :health=)
		assert_equal 1, @object.method(:health=).arity
	end
		
	def test_implements_set_vigor_interface	
		assert_respond_to(@object, :vigor=)
		assert_equal 1, @object.method(:vigor=).arity
	end

	def test_implements_eats_prob_interface
		assert_respond_to(@object, :eats_prob)
		assert_equal 0, @object.method(:eats_prob).arity
	end

	def test_implements_eaten_vulnerability_interface
		assert_respond_to(@object, :eaten_vulnerability)
		assert_equal 0, @object.method(:eaten_vulnerability).arity
	end

	# Class interface tests
	def test_class_implements_species_interface
		assert_respond_to(@object.class, :species)
		assert_equal 0, @object.class.method(:species).arity
	end

	def test_class_implements_max_health_interface
		assert_respond_to(@object.class, :max_health)
		assert_equal 0, @object.class.method(:max_health).arity
	end

	def test_class_implements_max_vigor_interface
		assert_respond_to(@object.class, :max_vigor)
		assert_equal 0, @object.class.method(:max_vigor).arity
	end

	def test_class_implements_age_curve_interface
		assert_respond_to(@object.class, :age_curve)
		assert_equal 0, @object.class.method(:age_curve).arity
	end

	def test_class_implements_health_curve_interface
		assert_respond_to(@object.class, :health_curve)
		assert_equal 0, @object.class.method(:health_curve).arity
	end

	def test_class_implements_vigor_curve_interface
		assert_respond_to(@object.class, :vigor_curve)
		assert_equal 0, @object.class.method(:vigor_curve).arity
	end

	def test_class_implements_survival_probability_interface
		assert_respond_to(@object.class, :survival_probability)
		assert_equal 1, @object.class.method(:survival_probability).arity
	end

	def test_class_implements_birth_probability_interface
		assert_respond_to(@object.class, :birth_probability)
		assert_equal 1, @object.class.method(:birth_probability).arity
	end
end
