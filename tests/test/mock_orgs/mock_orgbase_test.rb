# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../interfaces/orgbase_interface_test'
require_relative '../interfaces/mock_creatures_interface_test'
require_relative '../mocks'

class MockOrgbaseTest < Minitest::Test
  include OrgbaseInterfaceTest
  def setup
    @org = @object = MockOrgbase.new
  end
end

class SterileCritterTest < Minitest::Test
  include OrgbaseInterfaceTest
  include MockCreaturesInterfaceTest
  def setup
    @org = @object = SterileCritter.new
  end
end

class FertileCritterTest < Minitest::Test
  include OrgbaseInterfaceTest
  include MockCreaturesInterfaceTest
  def setup
    @org = @object = FertileCritter.new
  end
end

class VitalCritterTest < Minitest::Test
  include OrgbaseInterfaceTest
  include MockCreaturesInterfaceTest
  def setup
    @org = @object = VitalCritter.new
  end
end
