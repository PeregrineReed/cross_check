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

  attr_reader :files,
              :game_stats,
              :team_stats,
              :league_stats

  def initialize(files)
    @files = files
    @games = convert_files.games
    @teams = convert_files.teams
    add_seasons_to_teams
    update_stats
  end

  def self.from_csv(files)
    new(files)
  end

  def convert_files
    FileConverter.new(files)
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
