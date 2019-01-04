require './lib/game'
require './lib/game_stats'
require './lib/team'
require './lib/season'
require './lib/team_stats'
require './lib/stat_sorter'
require './lib/league_stats'
require './lib/file_converter'
require './lib/stat_tracker'
require './lib/page_generator'
require 'csv'
require 'erb'
require 'pry'

games_path = './data/game.csv'
teams_path = './data/team_info.csv'
game_teams_path = './data/game_teams_stats.csv'

files = {
games: games_path,
teams: teams_path,
game_teams: game_teams_path
}

template = './site/template.erb'
page_generator = PageGenerator.new(template, files)
page_generator.save
