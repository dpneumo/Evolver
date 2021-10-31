# frozen_string_literal: true

class Population
  def initialize( initial_pop_size: 10, toolbox: Toolbox, populator: Populator,
                  fissioner: Fissioner, reaper: Reaper, publisher: Publisher)
    @toolbox = toolbox.new
    @populator = populator.new(@toolbox)
    @fissioner = fissioner.new(@toolbox)
    @reaper    = reaper.new(@toolbox)
    @publisher = publisher.new(toolbox: @toolbox)
    @critters  = @populator.populate(initial_pop_size)
    @stats = @toolbox.stats
    @store = @toolbox.statstore
  end

  def run(periods: 1)
    return if periods < 1
    periods.times { |i| cycle( period: (i+1) ) }
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
      @critters = @fissioner.birth(@critters)
    end

    def survive
      @critters = @reaper.survive(@critters)
    end

    def age
      @critters.each { |c| c.age += 1 }
    end

    def record_data(period)
      @stats.add_population_data(@critters, period)
    end
end
