# frozen_string_literal: true

class Colors
  def self.mutations
    new.mutations
  end

  def self.colors
    {
      0 => 'test_color',
      1 => 'red',
      2 => 'green',
      3 => 'blue',
      4 => 'yellow'
    }
  end

  attr_reader :mutations

  def initialize
    @mutations = {
      0 => { 0 => 1.00, 1 => 0.00, 2 => 0.00, 3 => 0.00, 4 => 0.00 },
      1 => { 0 => 0.00, 1 => 0.70, 2 => 0.20, 3 => 0.05, 4 => 0.05 },
      2 => { 0 => 0.00, 1 => 0.10, 2 => 0.80, 3 => 0.05, 4 => 0.05 },
      3 => { 0 => 0.00, 1 => 0.15, 2 => 0.30, 3 => 0.50, 4 => 0.05 },
      4 => { 0 => 0.00, 1 => 0.05, 2 => 0.05, 3 => 0.30, 4 => 0.60 }
    }
  end
end
