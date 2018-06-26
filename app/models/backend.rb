class Backend
  def initialize
    @backend = BackendService.new
  end

  def get_teams
    raw_data = backend.get_teams
  end

  def add_team(team)
    raw_data = backend.add_team(team.name)
  end

  def delete_team(team)
    raw_data = backend.delete_team(team.name)
  end

  def get_team_players(team)
    raw_data = backend.get_team_players(team.name)
  end

  def add_teammember(user)
    raw_data = backend.add_teammember(user.team.name, user.leaguename)
  end

  def delete_teammember(user)
    raw_data = backend.delete_teammember(user.leaguename)
  end

  def update_team_flex_matches(team)
    raw_data = backend.update_team_flex_matches(team.name)
  end

  def update_solo_matches(user)
    raw_data = backend.update_solo_matches(user.leaguename)
  end

  def best_by_position(team, min_games)
    raw_data = backend.best_by_position(team.name, min_games)
  end

  def solo_stats(user)
    raw_data = backend.solo_stats(user.leaguename)
  end

  def single_player_flex_stats(user)
    raw_data = backend.single_player_flex_stats(user.leaguename)
  end

  def custom_team(player_top, player_mid, player_jun, player_adc, player_sup)
    top = nil
    mid = nil
    jun = nil
    adc = nil
    sup = nil
    top = player_top.leaguename if player_top
    mid = player_mid.leaguename if player_mid
    jun = player_jun.leaguename if player_jun
    adc = player_adc.leaguename if player_adc
    sup = player_sup.leaguename if player_sup
    backend.custom_team(top, mid, jun, adc, sup)
  end


  def one_players_flex_stats(player_1)
    raw_data = backend.one_players_flex_stats(player_1.leaguename)
  end

  def two_players_flex_stats(player_1, player_2)
    raw_data = backend.two_players_flex_stats(player_1.leaguename,
                                                player_2.leaguename)
  end

  def three_players_flex_stats(player_1, player_2, player_3)
    raw_data = backend.three_players_flex_stats(player_1.leaguename,
                                                player_2.leaguename,
                                                player_3.leaguename)
  end

  def four_players_flex_stats(player_1, player_2, player_3, player_4)
    raw_data = backend.four_players_flex_stats(player_1.leaguename,
                                                player_2.leaguename,
                                                player_3.leaguename,
                                                player_4.leaguename)
  end

  def five_players_flex_stats(player_1, player_2, player_3, player_4, player_5)
    raw_data = backend.five_players_flex_stats(player_1.leaguename,
                                                player_2.leaguename,
                                                player_3.leaguename,
                                                player_4.leaguename,
                                                player_5.leaguename)
  end

  private
    attr_reader :backend
end
