# frozen string literal: true

class Consumer
  include UtilityMethods

  def encounters(creatures:)
    census = creatures.census
    hunters = creatures.hunter_chain
    ratios = creatures.ratios
    hunters.each do |hunter_species, properties|
      prey_population = census[properties[:prey]]
      number_of_encounters = enctrs_count(hunter_species, ratios)
      census[hunter_species].each do |hunter|
        hunt(hunter, prey_population, number_of_encounters)
      end
    end
    nil
  end

  private
    def enctrs_count(hunter_species, ratios)
      hunter_class = constantize(hunter_species)
      hunter_prey_ratio = ratios[hunter_species]
      hunter_class.enctrs_count(hunter_prey_ratio)
    end

    def hunt(hunter, prey_population, number_of_encounters)
      return if prey_population.nil?
      prey_population.sample(number_of_encounters).each do |hunted|
        eaten(hunter, hunted) ? eat(hunter, hunted) : fast(hunter, hunted)
      end
    end

    def eaten(hunter, prey)
      flip(biased_coin: biased_coin(hunter, prey))
    end

    def biased_coin(hunter, prey)
      prey.eaten_vulnerability * hunter.eats_prob
    end

    def eat(hunter, hunted)
      hunted.health  = 0
      hunter.health += 30
    end

    def fast(hunter, hunted)
      hunted.health -= 3
      hunter.health -= 1
    end
end
