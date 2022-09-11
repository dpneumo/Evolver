# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/orgbase_encounters'

class TOrg0; extend OrgbaseEncounters; end
class TOrg1; extend OrgbaseEncounters; end

class OrgbaseEncountersTest < Minitest::Test
end
