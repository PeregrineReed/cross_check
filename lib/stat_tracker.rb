class StatTracker
  attr_reader :files

  def initialize(files)
    @files = files
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

end
