class BackendService
  def initialize
    @headers = {  }
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_teams
    get_url("/teams/list")
  end

  def get_team_players(team_name)
    @headers['team'] = team_name
    get_url("/teams/get_team_members")
  end

  def best_by_position(team_name, min_games)
    @headers['team'] = team_name
    @headers['min'] = min_games.to_s
    get_url("/teams/best_by_position")
  end

  def solo_stats(username)
    @headers['player'] = username
    get_url("/teams/solo_stats")
  end

  private
    attr_reader :headers

    def conn
      Faraday.new('http://localhost:8000', headers: headers)
    end
end
