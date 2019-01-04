require_relative './team'
require_relative './game'
require_relative './season'
require_relative './stat_sorter'
require_relative './game_stats'
require_relative './team_stats'
require_relative './league_stats'
require_relative './season_stats'
require_relative './file_converter'
require 'csv'

class StatTracker < StatSorter

  include GameStats
  include TeamStats
  include LeagueStats
  include SeasonStats

  attr_reader :game_stats,
              :team_stats

  def initialize(games, teams)
    super(games, teams)
    add_seasons_to_teams
    update_stats
  end

  def self.from_csv(files)
    converter = FileConverter.new(files)
    games = converter.games
    teams = converter.teams
    StatTracker.new(games, teams)
  end

  def percentage_home_wins
    wins_percentage("home")
  end

  def percentage_visitor_wins
    wins_percentage("away")
  end

  def count_of_teams
    @teams.count
  end

end
