require './test/test_helper'
require 'mocha/minitest'
require './lib/team_stats'
require './lib/team'
require 'pry'

class TeamStatsTest < Minitest::Test

  def setup

    team_1_info = {team_id: "1",franchiseId: "23",shortName: "New Jersey",teamName: "Devils",abbreviation: "NJD",link: "/api/v1/teams/1"}
    team_4_info = {team_id: "4",franchiseId: "16",shortName: "Philadelphia",teamName: "Flyers",abbreviation: "PHI",link: "/api/v1/teams/4"}

    @team_1 = Team.new(team_1_info)
    @team_4 = Team.new(team_4_info)
    @teams = [
      @team_1,
      @team_4,
    ]

   @team_stats = TeamStats.new(@teams)

  end

  def test_it_exists
    assert_instance_of TeamStats, @team_stats
  end

  def test_it_has_teams
    assert_equal @teams, @team_stats.teams
  end

end
