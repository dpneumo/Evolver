# frozen_string_literal: true

class Population
  def initialize(initial_pop_size: 10)
    @stats = Stats.new
    @id_gen    = IDGenerator.new
    @populator = Populator.new(@id_gen)
    @fissioner = Fissioner.new(@id_gen)
    @reaper    = Reaper.new(stats: @stats)
    @publisher = Publisher.new
    @critters  = @populator.populate(initial_pop_size)
  end

  def run(count: 10)
    count.times { |i| cycle(i + 1) }
    show_stats
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

  def show_stats
    @publisher.publish(@stats)
  end
end
