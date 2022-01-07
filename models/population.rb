# frozen_string_literal: true

class Population
  def initialize( initial_pop_size: 10, toolbox: Toolbox, populator: Populator,
                  fissioner: Fissioner, reaper: Reaper, publisher: Publisher)
    @toolbox   = toolbox.new
    @populator = populator.new(toolbox: @toolbox)
    @fissioner = fissioner.new(toolbox: @toolbox)
    @reaper    = reaper.new(toolbox: @toolbox)
    @publisher = publisher.new(toolbox: @toolbox)
    @critters  = @populator.populate(size: initial_pop_size, species: Critter)
    @rabbits   = @populator.populate(size: initial_pop_size, species: Rabbit)
    @coyotes   = @populator.populate(size: initial_pop_size, species: Coyote)
    @stats = @toolbox.stats
    @store = @toolbox.statstore
  end

  def run(periods: 1)
    return if periods < 1
    periods.times {|i| cycle(i+1) }
  end

  def show_stats
    @publisher.publish
  end

  private
    def cycle(period)
      birth
      survive
      age
      record_data(period)
    end

    def birth
      #@critters = @fissioner.birth(critters: @critters)
      @rabbits = @fissioner.birth(critters: @rabbits)
      @coyotes = @fissioner.birth(critters: @coyotes)
    end

    def survive
      #@critters = @reaper.survive(critters: @critters)
      @rabbits = @reaper.survive(critters: @rabbits)
      @coyotes = @reaper.survive(critters: @coyotes)
    end

    def age
      #@critters.each { |c| c.age += 1 }
      @rabbits.each { |r| r.age += 1 }
      @coyotes.each { |c| c.age += 1 }
    end

    def record_data(period)
      #@stats.add_population_data(critters: @critters, period: period)
      @stats.add_population_data(critters: @rabbits, period: period)
      @stats.add_population_data(critters: @coyotes, period: period)
    end
end
