class Games

  attr_reader :stats

  def initialize(game_stats)
    @stats = game_stats
  end

  def stat_games_count(stat)
    games_collection = {}
    stat_collect(stat).each do |collection|
      collection = collection.to_sym
      games_collection[collection] = 0
      @stats.values.each do |game_stats|
        if game_stats[stat] == collection.to_s
          games_collection[collection] += 1
        end
      end
    end
    games_collection
  end

  def stat_collect(stat)
    collection = []
    @stats.values.each do |game_stats|
      game_stats.each do |key, value|
        if key == stat && !(collection.include?(value))
          collection << value
        end
      end
    end
    return collection.sort
  end

  def stat_with_most_games(stat)
    most_games = stat_games_count(stat).values.max
    stat_games_count(stat).key(most_games).to_s.to_i
  end

  def stat_with_fewest_games(stat)
    least_games = stat_games_count(stat).values.min
    stat_games_count(stat).key(least_games).to_s.to_i
  end

  def away_game_scores
    @stats.values.map do |game_stats|
      game_stats[:away_goals].to_i
    end
  end

  def home_game_scores
    @stats.values.map do |game_stats|
      game_stats[:home_goals].to_i
    end
  end

  def total_scores
    hoa = home_game_scores.zip(away_game_scores)
    hoa = hoa.map do |pair|
      pair.sum
    end
    hoa.flatten
  end

  def max_score
    total_scores.max
  end

  def min_score
    total_scores.min
  end

  def blowout
    hoa = home_game_scores.zip(away_game_scores)
    hoa = hoa.map do |pair|
      pair.max - pair.min
    end
    hoa.flatten.max
  end



end
