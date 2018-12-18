class Games

  attr_reader :stats

  def initialize(game_stats)
    @stats = game_stats
  end

  def season_games_count
    seasons = []
    season_games = {}
    @stats.values.each do |game_stats|
      game_stats.each do |key, value|
        if key == :season && !(seasons.include?(value))
          seasons << value.to_sym
        end
      end
    end
    seasons.each do |season|
      season_games[season] = 0
      @stats.values.each do |game_stats|
        if game_stats[:season] == season.to_s
          season_games[season] += 1
        end
      end
    end
    season_games
  end

  def season_with_most_games
    most_games = season_games_count.values.max
    season_games_count.key(most_games).to_s.to_i
  end

  def season_with_fewest_games
    least_games = season_games_count.values.min
    season_games_count.key(least_games).to_s.to_i
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
