# frozen_string_literal: true

  # Examples:
  # foodchain = { 'coyote' => {size:  5, prey: 'rabbit'},
  #               'rabbit' => {size: 15, prey: 'carrot'},
  #               'carrot' => {size:  0, prey: 'none'  } }

class Creatures
  include UtilityMethods

  attr_accessor :census
  attr_reader   :hunter_chain

  def initialize(foodchain:)
    @foodchain = foodchain
    @census = init_census
    build_hunter_chain
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
    def init_census
      @foodchain.reduce({}) do |c, (species, properties)|
        population = populate(size: properties[:size],  species: species )
        c.update( species => population )
      end
    end

    def build_hunter_chain
      @hunter_chain = @foodchain.clone
      res = @hunter_chain.reject! {|_, prop| prop[:prey] == 'none'}
      err_msg = 'foodchain does not have a base_species'
      raise ArgumentError, err_msg unless res 
      nil
    end

    def ratio(hunter, prey)
      return 20.0 if @census[hunter].count.zero?
      @census[prey].count.fdiv(@census[hunter].count).clamp(1.0 .. 20.0)
    end
end
