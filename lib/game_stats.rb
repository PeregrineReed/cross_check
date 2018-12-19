class GameStats

  attr_reader :games,
              :seasons

  def initialize(games)
    @games = games
    @seasons = []
  end

  def season_games
    games_by_season = @games.group_by do |game|
      game.season
    end
    games_by_season.each do |key, value|
      games_by_season[key] = value.count
    end
    games_by_season
  end

  def season_with_most_games
    most_games = season_games.values.max
    season_games.key(most_games)
  end

  # def stat_games_count(stat)
  #   games_collection = {}
  #   stat_collect(stat).each do |element|
  #     element = element.to_sym
  #     games_collection[element] = 0
  #     @stats.values.each do |game_stats|
  #       if game_stats[stat] == element.to_s
  #         games_collection[element] += 1
  #       end
  #     end
  #   end
  #   games_collection
  # end

  def seasons_list
    @games.each do |game|
      @seasons << game.season
    end
    @seasons.uniq!.sort!
  end
    # collection = []
    # @stats.values.each do |game_stats|
    #   game_stats.each do |key, value|
    #     if key == stat && !(collection.include?(value))
    #       collection << value
    #     end
    #   end
    # end
    # return collection.sort

  def stat_with_most_games(stat)
    most_games = stat_games_count(stat).values.max
    if stat == :season
      stat_games_count(stat).key(most_games).to_s.to_i
    elsif stat == :venue
      stat_games_count(stat).key(most_games).to_s
    end
  end

  def stat_with_fewest_games(stat)
    least_games = stat_games_count(stat).values.min
    if stat == :season
      stat_games_count(stat).key(least_games).to_s.to_i
    elsif stat == :venue
      stat_games_count(stat).key(least_games).to_s
    end
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

  def total_goals_stat(stat)
    goals_collection = {}
    stat_collect(stat).each do |element|
      element = element.to_sym
      goals_collection[element] = 0
      @stats.values.each do |game_stats|
        if game_stats[stat] == element.to_s
          total_goals = (game_stats[:away_goals].to_i + game_stats[:home_goals].to_i)
          goals_collection[element] += total_goals
        end
      end
    end
    goals_collection
  end

  def average_goals_stat(stat)
    goals_collection = {}
    stat_collect(stat).each do |element|
      element = element.to_sym
      average = total_goals_stat(stat)[element] / stat_games_count(stat)[element].to_f
      goals_collection[element] = average
    end
    goals_collection
  end

  def average_goals_game
    (total_goals_stat(:season).values.sum / @stats.count.to_f).round(2)
  end

  def home_wins_percent
    hoa = home_game_scores.zip(away_game_scores)
    home_wins = 0
    away_wins = 0
    ties = 0
    hoa.each do |pair|
      if (pair[0] - pair[1]) > 0
        home_wins += 1
      elsif (pair[0] - pair[1]) < 0
        away_wins += 1
      else
        ties += 1
      end
    end
    (home_wins / @stats.count.to_f * 100).round(2)
  end

  def away_wins_percent
    hoa = home_game_scores.zip(away_game_scores)
    away_wins = 0
    hoa.each do |pair|
      if (pair[0] - pair[1]) < 0
        away_wins += 1
      end
    end
    (away_wins / @stats.count.to_f * 100).round(2)
  end




end
