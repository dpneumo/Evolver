# frozen_string_literal: true

  # Examples:
  # foodchain = { 'coyote' => {size:  5, prey: 'rabbit'},
  #               'rabbit' => {size: 15, prey: 'carrot'},
  #               'carrot' => {size:  0, prey: 'none'  } }

class Creatures
  attr_accessor :census
  attr_reader   :foodchain, :base_species

  def initialize(foodchain:)
    @foodchain = foodchain
    @base_species = last_species(foodchain)
    @census = @foodchain.reduce({}) do |c, (species, properties)|
      population = populate(size: properties[:size],  species: species )
      c.update( species => population )
    end
    nil
  end

  def populate(size:, species:)
    size.times.map {|_n| constantize(species).new }
  end

  def age
    @census.each do |species, members|
      members.each {|member| member.age += 1 }
    end
  end

  def ratios
    @foodchain.reduce({}) do |r, (hunter, detail)|
      r.update(hunter => ratio(hunter, detail[:prey]))
    end
  end

  def scale_factors
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

    def last_species(foodchain)
      foodchain.each do |species, properties|
        return species if properties[:prey] == 'none'
      end
      raise ArgumentError, 'foodchain does not have a base_species'
    end
end
