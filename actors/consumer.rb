# frozen string literal: true

class Consumer
  include UtilityMethods

  def encounters(creatures:)
    ratios = creatures.ratios
    scales = creatures.scales
    census = creatures.census
    creatures.foodchain.each do |hunters, detail|
      enctrs = enctrs_count(ratios[hunters], scales[hunters])
      census[hunters].each do |hunter|
        hunt(hunter, census[detail[:prey]], enctrs)
      end
    end
    nil
  end

  private
    def hunt(hunter, prey, enctrs)
      return if prey.nil?
      prey.sample(enctrs).each do |hunted|
        eaten(hunter, hunted) ? eat(hunter, hunted) : fast(hunter, hunted)
      end
    end

    def eat(hunter, hunted)
      hunted.health  = 0
      hunter.health += 30
    end

    def fast(hunter, hunted)
      hunted.health -= 4
      hunter.health -= 4
    end

    def enctrs_count(ratio, scale)
      return 0 if (ratio.nil? || scale.nil?)
      log2curve(x:ratio, scale:scale).truncate
    end

    def eaten(hunter, prey)
      #puts "prey eaten prob: #{prey.eaten_prob}"
      #puts "hunter eats prob: #{hunter.eats_prob}"
      #puts
      flip(biased_coin: biased_coin(hunter, prey))
    end

    def biased_coin(hunter, prey)
      prey.eaten_prob * hunter.eats_prob
    end
end
