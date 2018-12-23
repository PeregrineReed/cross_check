class FileConverter

  attr_reader :games,
              :teams,
              :game_teams

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
    game_data.each do |row|
      game = {
        game_id: row[:game_id],
        season: row[:season],
        type: row[:type],
        date_time: row[:date_time],
        away_team_id: row[:away_team_id],
        home_team_id: row[:home_team_id],
        away_goals: row[:away_goals],
        home_goals: row[:home_goals],
        outcome: row[:outcome],
        home_rink_side_start: row[:home_rink_side_start],
        venue: row[:venue],
        venue_link: row[:venue_link],
        venue_time_zone_id: row[:venue_time_zone_id],
        venue_time_zone_offset: row[:venue_time_zone_offset],
        venue_time_zone_tz: row[:venue_time_zone_tz]
      }
      games << Game.new(game)
    end
  games
  end

  def convert_teams
    teams_data = parse_csv(@teams_file)
    teams = []
    teams_data.each do |row|
      team = {
        team_id: row[:team_id],
        franchise_id: row[:franchiseid],
        short_name: row[:shortname],
        team_name: row[:teamname],
        abbreviation: row[:abbreviation],
        link: row[:link]
      }
      teams << Team.new(team)
    end
  teams
  end

end
