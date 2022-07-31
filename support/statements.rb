# frozen_string_literal: true

class Statements
  def period_stats(stats)
    puts <<~TEXT
      pop stats by period:
      #{stats}
    TEXT
  end
  
  def death_stats(stats)
    puts <<~TEXT
      mean age at death by_species:
      #{stats}
    TEXT
  end
end