require_relative './game'
require_relative './game_stats'
require_relative './team'
require_relative './season'
require_relative './team_stats'
require_relative './stat_sorter'
require_relative './league_stats'
require_relative './season_stats'
require_relative './file_converter'
require_relative './stat_tracker'
require 'csv'

class StatTracker < StatSorter

  include GameStats
  include TeamStats
  include LeagueStats
  include SeasonStats

  attr_reader :files,
              :game_stats,
              :team_stats,
              :league_stats

  def initialize(files)
    @files = files
    @games = convert_files.games
    @teams = convert_files.teams
    # @game_stats = compile_stats[:games]
    # @team_stats = compile_stats[:teams]
    # @league_stats = compile_stats[:league]
    add_seasons_to_teams
    update_stats
  end

  def self.from_csv(files)
    new(files)
  end

  def convert_files
    FileConverter.new(files)
  end

  def compile_stats
    {
    # games: GameStats.new(@games),
    # teams: TeamStats.new(@teams),
    # league: LeagueStats.new(@games, @teams)
    }
  end

# Game Statistics
# ======================================
  # def highest_total_score
  #   game_stats.max_score
  # end
  #
  # def lowest_total_score
  #   game_stats.min_score
  # end
  #
  # def biggest_blowout
  #   game_stats.blowout
  # end
  #
  # def most_popular_venue
  #   game_stats.venue_with_most_games
  # end
  #
  # def least_popular_venue
  #   game_stats.venue_with_fewest_games
  # end
  #
  def percentage_home_wins
    wins_percentage("home")
  end

  def percentage_visitor_wins
    wins_percentage("away")
  end
  #
  # def season_with_most_games
  #   game_stats.season_with_most_games
  # end
  #
  # def season_with_fewest_games
  #   game_stats.season_with_fewest_games
  # end
  #
  # def count_of_games_by_season
  #   game_stats.list_season_games
  # end
  #
  # def average_goals_per_game
  #   game_stats.average_game_goals
  # end
  #
  # def average_goals_by_season
  #   game_stats.average_goals_by_season
  # end

  # League Statistics
  # ======================================
  def count_of_teams
    @teams.count
  end
  #
  # def best_offense
  #   league_stats.best_offense
  # end
  #
  # def worst_offense
  #   league_stats.worst_offense
  # end
  #
  # def best_defense
  #   league_stats.best_defense
  # end
  #
  # def worst_defense
  #   league_stats.worst_defense
  # end
  #
  # def highest_scoring_visitor
  #   league_stats.highest_scoring_visitor
  # end
  #
  # def highest_scoring_home_team
  #   league_stats.highest_scoring_home_team
  # end
  #
  # def lowest_scoring_visitor
  #   league_stats.lowest_scoring_visitor
  # end
  #
  # def lowest_scoring_home_team
  #   league_stats.lowest_scoring_home_team
  # end
  #
  # def winningest_team
  #   league_stats.winningest_team
  # end
  #
  # def best_fans
  #   league_stats.best_fans
  # end
  #
  # def worst_fans
  #   league_stats.worst_fans
  # end

  # Season Statistics
  # ======================================

  # def biggest_bust
  # end
  #
  # def biggest_surprise
  # end
  #
  # def season_summary
  # end
  #
  # #Team Statistics
  # # ======================================
  #
  # def team_info
  # end
  #
  # def best_season
  # end
  #
  # def worst_season
  # end
  #
  # def average_win_percentage
  # end
  #
  # def most_goals_scored
  # end
  #
  # def fewest_goals_scored
  # end
  #
  # def favorite_opponent
  # end
  #
  # def rival
  # end
  #
  # def biggest_team_blowout
  # end
  #
  # def worst_loss
  # end
  #
  # def head_to_head
  # end
  #
  # def seasonal_summary
  # end

end
