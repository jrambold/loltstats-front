class Team < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :google_users, through: :users

  after_create do |team|
    add_team(team)
  end

  before_destroy do |team|
    delete_team(team)
  end

  def self.backend_teams
    backend = Backend.new
    teams = backend.get_teams
  end

  def update_matches
    backend = Backend.new
    backend.update_team_flex_matches(self)
  end

  def best_by_position(min=6)
    backend = Backend.new
    backend.best_by_position(self, min)
  end

  def custom_team(top,mid,jun,adc,sup)
    if top == ""
      top = nil
    else
      top = User.find(top)
    end
    if mid == ""
      mid = nil
    else
      mid = User.find(mid)
    end
    if jun == ""
      jun = nil
    else
      jun = User.find(jun)
    end
    if adc == ""
      adc = nil
    else
      adc = User.find(adc)
    end
    if sup == ""
      sup = nil
    else
      sup = User.find(sup)
    end
    backend = Backend.new
    backend.custom_team(top, mid, jun, adc, sup)
  end

  def together(p1,p2,p3,p4,p5)
    if p1 == ""
      p1 = nil
    else
      p1 = User.find(p1)
    end
    if p2 == ""
      p2 = nil
    else
      p2 = User.find(p2)
    end
    if p3 == ""
      p3 = nil
    else
      p3 = User.find(p3)
    end
    if p4 == ""
      p4 = nil
    else
      p4 = User.find(p4)
    end
    if p5 == ""
      p5 = nil
    else
      p5 = User.find(p5)
    end
    players = [p1,p2,p3,p4,p5].compact
    backend = Backend.new
    case players.length
    when 1
      backend.one_players_flex_stats(players[0])
    when 2
      backend.two_players_flex_stats(players[0], players[1])
    when 3
      backend.three_players_flex_stats(players[0], players[1], players[2])
    when 4
      backend.four_players_flex_stats(players[0], players[1], players[2], players[3])
    when 5
      backend.five_players_flex_stats(players[0], players[1], players[2], players[3], players[4])
    else
      return { percent: -1, wins: -1, losses: -1, total: -1 }
    end

  end

  private
    def add_team(team)
      backend = Backend.new
      backend.add_team(team)
    end

    def delete_team(team)
      backend = Backend.new
      backend.delete_team(team)
    end


end
