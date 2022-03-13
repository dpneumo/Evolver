# frozen_string_literal: true

class Runner
  def initialize( foodchain:, creatures: Creatures,
                  fissioner: Fissioner, consumer: Consumer, reaper: Reaper,
                  stats: Stats, statstore: StatStore,
                  publisher: Publisher)
    @statstore = statstore.new
    @stats = stats.new(store: @statstore)
    @creatures = creatures.new(foodchain: foodchain)
    @fissioner = fissioner.new
    @consumer  = consumer.new
    @reaper    = reaper.new(stats: @stats)
    @publisher = publisher.new(stats: @stats)
    nil
  end

  def run(periods: 1)
    return if periods < 1
    record_data(0)
    periods.times {|i| cycle(i+1) }
    nil
  end

  def show_stats
    @publisher.publish
    nil
  end

  private
    def cycle(period)
      reproduce
      hunt
      survive
      age
      record_data(period)
    end

    def reproduce
      @fissioner.reproduce(creatures: @creatures)
    end

    def hunt
      @consumer.encounters(creatures: @creatures)
    end

    def survive
      @reaper.survive(creatures: @creatures)
    end

    def age
      @creatures.age
    end

    def record_data(period)
      @stats.add_population_data(creatures: @creatures, period: period)
    end
end
