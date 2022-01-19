# frozen_string_literal: true

class Runner
  def initialize( initial_pop_size: 10, toolbox: Toolbox,
                  fissioner: Fissioner, reaper: Reaper, publisher: Publisher)
    @toolbox   = toolbox.new
    @fissioner = fissioner.new(toolbox: @toolbox)
    @reaper    = reaper.new(toolbox: @toolbox)
    @publisher = publisher.new(toolbox: @toolbox)
    @rabbits   = populate(size: initial_pop_size, species: Rabbit)
    @coyotes   = populate(size: initial_pop_size, species: Coyote)
    @stats = @toolbox.stats
    @store = @toolbox.statstore
  end

  def run(periods: 1)
    return if periods < 1
    record_data(0)
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
      @rabbits = @fissioner.birth(critters: @rabbits)
      @coyotes = @fissioner.birth(critters: @coyotes)
    end

    def survive
      @rabbits = @reaper.survive(critters: @rabbits)
      @coyotes = @reaper.survive(critters: @coyotes)
    end

    def age
      @rabbits.each { |r| r.age += 1 }
      @coyotes.each { |c| c.age += 1 }
    end

    def record_data(period)
      @stats.add_population_data(critters: @rabbits, period: period)
      @stats.add_population_data(critters: @coyotes, period: period)
    end

    def populate(size:, species:)
      size.times.map {|_n| species.new(toolbox: @toolbox) }
    end
end
