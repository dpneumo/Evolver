# frozen string literal: true

class Consumer
  include UtilityMethods

  def encounters(creatures:)
    ratios = creatures.ratios
    scale_factors = creatures.scale_factors
    census = creatures.census
    base_species = creatures.base_species
    creatures.foodchain.each do |species, properties|
      break if species == base_species
      enctrs = enctrs_count(ratios[species], scale_factors[species])
      census[species].each do |member|
        hunt(member, census[properties[:prey]], enctrs)
      end
    end
    nil
  end

  private
    def hunt(hunter, prey, enctrs)
      return if prey.nil?
      prey.sample(enctrs).each do |hunted|
        #binding.pry
        eaten(hunter, hunted) ? eat(hunter, hunted) : fast(hunter, hunted)
      end
    end

    def eat(hunter, hunted)
      hunted.health  = 0
      hunter.health += 30
    end

    def fast(hunter, hunted)
      hunted.health -= 3
      hunter.health -= 1
    end

    def enctrs_count(ratio, scale)
      return 0 if (ratio.nil? || scale.nil?)
      log2curve(x:ratio, scale:scale).truncate
    end

    def eaten(hunter, prey)
      #puts "prey eaten prob: #{prey.eaten_vulnerability}"
      #puts "hunter eats prob: #{hunter.eats_prob}"
      #puts
      flip(biased_coin: biased_coin(hunter, prey))
    end

    def biased_coin(hunter, prey)
      prey.eaten_vulnerability * hunter.eats_prob
    end
    # vulnerability & capability?
end
