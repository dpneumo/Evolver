# frozen_string_literal: true

class Creatures
  attr_accessor :census
  attr_reader   :foodchain, :baselink

  def initialize(foodchain:, baselink:)
    @foodchain = foodchain
    @baselink = baselink
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
    @foodchain.reduce({}) do |r, (hunter, detail)|
      r.update(hunter => ratio(hunter, detail[:prey]))
    end
  end

  def scales
    @foodchain.reduce({}) do |s, (hunter, prey)|
      s.update(hunter => constantize(hunter).enctr_scale)
    end
  end

  private
    def ratio(hunter, prey)
      return 20.0 if @census[hunter].count.zero?
      @census[prey].count.fdiv(@census[hunter].count).clamp(1.0 .. 20.0)
    end

    def constantize(my_str)
      Object.const_get(my_str.split('_').map(&:capitalize).join)
    end
end
