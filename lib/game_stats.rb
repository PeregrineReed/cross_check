module GameStats

  # attr_reader :games
  #
  # def initialize(games)
  #   @games = games
  # end

  def list_seasons
    @games.map do |game|
      game.season
    end.uniq!.sort!
  end

  def games_by_season
    @games.group_by do |game|
      game.season
    end
  end

  def count_of_games_by_season
    season_games = {}
    games_by_season.each do |season, games|
      season_games[season] = games.count
    end
    season_games
  end

  def season_with_most_games
    most_games = count_of_games_by_season.values.max
    count_of_games_by_season.key(most_games)
  end

  def season_with_fewest_games
    fewest_games = count_of_games_by_season.values.min
    count_of_games_by_season.key(fewest_games)
  end

  def total_scores
    @games.map { |game| game.total_score }
  end

  def highest_total_score
    total_scores.max
  end

  def lowest_total_score
    total_scores.min
  end

  def away_game_scores
    @games.map do |game|
      game.away_goals
    end
  end

  def home_game_scores
    @games.map do |game|
      game.home_goals
    end
  end

  def biggest_blowout
    @games.map do |game|
      game.blowout
    end.max
  end

  def list_venues
    @games.map do |game|
      game.venue
    end.uniq!.sort!
  end

  def games_by_venue
    @games.group_by do |game|
      game.venue
    end
  end

  def list_games_by_venue
    venues = {}
    games_by_venue.each do |venue, games|
      venues[venue] = games.size
    end
    venues
  end

  def most_popular_venue
    most_games = list_games_by_venue.values.max
    list_games_by_venue.key(most_games)
  end

  def least_popular_venue
    fewest_games = list_games_by_venue.values.min
    list_games_by_venue.key(fewest_games)
  end

  def total_season_goals
    season_goals = {}
    games_by_season.each do |season, games|
      season_goals[season] = games.sum do |game|
        game.total_score
      end
    end
    season_goals
  end

  def average_goals_by_season
    season_average = {}
    total_season_goals.each do |season, total|
      games = games_by_season[season].size
      season_average[season] = (total.to_f / games).round(2)
    end
    season_average
  end

  def average_goals_per_game
    (total_scores.sum / @games.size.to_f).round(2)
  end

  def wins_percentage(site)
    wins = @games.reject do |game|
      game.outcome[0..3] != site
    end
    (wins.size / @games.size.to_f * 100).round(2)
  end
end
