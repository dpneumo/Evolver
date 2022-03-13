# frozen_string_literal: true

class Creatures
  attr_accessor :census
  attr_reader   :foodchain

  def initialize(foodchain:)
    @foodchain = foodchain
    @census = @foodchain.reduce({}) do |c, (species, list)|
      population = populate(size: list[:size],  species: species )
      c.update( species => population )
    end
    nil
  end

  def populate(size:, species:)
    size.times.map {|_n| constantize(species).new }
  end

  def age
    census.each do |species, list|
      list.each {|critter| critter.age += 1 }
    end
  end

  def ratios
    @foodchain.reduce({}) do |r, (hunters, detail)|
      r.update(hunters => ratio(hunters, detail[:prey]))
    end
  end

  def scales
    @foodchain.reduce({}) do |s, (hunters, prey)|
      s.update(hunters => constantize(hunters).enctr_scale)
    end
  end

  private
    def ratio(hunters, prey)
      return 20.0 if @census[hunters].count.zero?
      @census[prey].count.fdiv(@census[hunters].count).clamp(1.0 .. 20.0)
    end

    def constantize(my_str)
      Object.const_get(my_str.split('_').map(&:capitalize).join)
    end
end
