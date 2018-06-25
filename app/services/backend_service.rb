class BackendService
  def initialize
    @headers = { 'FRONT_KEY' => ENV['FRONT_KEY'] }
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_teams
    get_url("/teams/list")
  end

  def add_team(team_name)
    @headers['team'] = team_name
    get_url("/teams/add_team")
  end

  def delete_team(team_name)
    @headers['team'] = team_name
    get_url("/teams/delete_team")
  end

  def get_team_players(team_name)
    @headers['team'] = team_name
    get_url("/teams/get_team_members")
  end

  def add_teammember(team_name, player_name)
    @headers['team'] = team_name
    @headers['name'] = player_name
    get_url("/teams/add_member")
  end

  def delete_teammember(player_name)
    @headers['name'] = player_name
    get_url("/teams/delete_member")
  end

  def update_team_flex_matches(team_name)
    @headers['team'] = player_name
    get_url("/teams/populate")
  end

  def update_solo_matches(player_name)
    @headers['name'] = player_name
    get_url("/teams/solo_populate")
  end

  def best_by_position(team_name, min_games)
    @headers['team'] = team_name
    @headers['min'] = min_games.to_s
    get_url("/teams/best_by_position")
  end

  def solo_stats(player_name)
    @headers['name'] = player_name
    get_url("/teams/solo_stats")
  end

  def custom_team(player_top, player_mid, player_jun, player_adc, player_sup)
    @headers['top'] = player_top if player_top
    @headers['mid'] = player_mid if player_mid
    @headers['jun'] = player_jun if player_jun
    @headers['adc'] = player_adc if player_adc
    @headers['sup'] = player_sup if player_sup
    get_url("/teams/custom_team")
  end

  def single_player_flex_stats(player_name)
    @headers['name'] = player_name
    get_url("/teams/solo")
  end

  def two_players_flex_stats(player_1, player_2)
    @headers['p1'] = player_1
    @headers['p2'] = player_2
    get_url("/teams/duo")
  end

  def three_players_flex_stats(player_1, player_2, player_3)
    @headers['p1'] = player_1
    @headers['p2'] = player_2
    @headers['p3'] = player_3
    get_url("/teams/trio")
  end

  def four_players_flex_stats(player_1, player_2, player_3, player_4)
    @headers['p1'] = player_1
    @headers['p2'] = player_2
    @headers['p3'] = player_3
    @headers['p4'] = player_4
    get_url("/teams/quad")
  end

  def five_players_flex_stats(player_1, player_2, player_3, player_4, player_5)
    @headers['p1'] = player_1
    @headers['p2'] = player_2
    @headers['p3'] = player_3
    @headers['p4'] = player_4
    @headers['p5'] = player_5
    get_url("/teams/squad")
  end

  private
    attr_reader :headers

    def conn
      Faraday.new('https://loltstats-b.herokuapp.com/', headers: headers)
    end
end
