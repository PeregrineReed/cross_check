class FileConverter

  attr_reader :games_file,
              :games,
              :teams_file,
              :teams,
              :game_teams_file,
              :games_teams

  def initialize(files)
    @games_file = files[:games]
    @games = convert_games
    @teams_file = files[:teams]
    @teams = convert_teams
    @game_teams_file = files[:game_teams]
  end

  def parse_csv(file)
    CSV.open(file, headers: true, header_converters: :symbol) #converters: :numeric
  end

  def convert_games
    game_data = parse_csv(@games_file)
    games = []
    game_data.each do |game|
      games << Game.new(game)
    end
  games
  end

  def convert_teams
    teams_data = parse_csv(@teams_file)
    teams = []
    teams_data.each do |team|
      teams << Team.new(team)
    end
  teams
  end

end
