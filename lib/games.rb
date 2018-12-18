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

end
