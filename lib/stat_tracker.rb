class StatTracker
  attr_reader :files,
              :game_stats,
              :team_stats,
              :league_stats

  def initialize(files)
    @files = files
    @games = convert_files.games
    @teams = convert_files.teams
    @game_stats = compile_stats[:games]
    @team_stats = compile_stats[:teams]
    @league_stats = compile_stats[:league]
    @league_stats.sort_team_games
  end

  def self.from_csv(files)
    new(files)
  end

  # StatCompiler superclass
  # ======================================
  def convert_files
    FileConverter.new(files)
  end

  def compile_stats
    {
    games: GameStats.new(@games),
    teams: TeamStats.new(@teams),
    league: TeamStatSorter.new(@games, @teams)
    }
  end

# Game Statistics
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

  def percentage_visitor_wins
    game_stats.wins_percentage("away")
  end

  def season_with_most_games
    game_stats.season_with_most_games
  end

  def season_with_fewest_games
    game_stats.season_with_fewest_games
  end

  def count_of_games_by_season
    game_stats.list_season_games
  end

  def average_goals_per_game
    game_stats.average_game_goals
  end

  def average_goals_by_season
    game_stats.average_goals_by_season
  end

  # League Statistics
  # ======================================
  def count_of_teams
    team_stats.teams.count
  end

  def best_offense
    team_stats.highest_offense
  end

  def worst_offense
    team_stats.lowest_offense
  end

end
