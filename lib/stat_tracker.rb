class StatTracker
  attr_reader :files,
              :game_stats,
              :team_stats,
              :league_stats

  def initialize(files)
    @files = files
    @game_stats = compile_game_stats
    @team_stats = compile_team_stats
    @league_stats = compile_league_stats
  end

  def self.from_csv(files)
    new(files)
  end

  # StatCompiler superclass
  # ======================================
  def convert_files
    FileConverter.new(files)
  end

  def compile_game_stats
    games = convert_files.games
    GameStats.new(games)
  end

  def compile_team_stats
    teams = convert_files.teams
    TeamStats.new(teams)
  end

  def compile_league_stats
    games = convert_files.games
    teams = convert_files.teams
    LeagueStats.new(games, teams)
  end
#Compile season stats, game teams stats
# ======================================

  def highest_total_score
    game_stats.max_score
  end

  def lowest_total_score
    game_stats.min_score
  end

  def biggest_blowout
    game_stats.blowout
  end

  def most_popular_venue
    game_stats.venue_with_most_games
  end

  def least_popular_venue
    game_stats.venue_with_fewest_games
  end

  def percentage_home_wins
    game_stats.wins_percentage("home")
  end

end
