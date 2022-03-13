# frozen_string_literal: true

class Creatures
  attr_accessor :census
  attr_reader   :foodchain

  def initialize
    @census = {'coyotes' => populate(size: 1, species: Coyote),
               'rabbits' => populate(size: 2, species: Rabbit)}
    @foodchain = {'coyotes' => 'rabbits'}
    nil
  end

  def populate(size:, species:)
    size.times.map {|_n| species.new }
  end

  def age
    census.each do |species, list|
      list.each {|critter| critter.age += 1 }
    end
  end

  def ratios
    @foodchain.reduce({}) do |r, (hunters, prey)|
      r.update(hunters => ratio(hunters, prey))
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
      Object.const_get(my_str.chop.capitalize)
    end
end
