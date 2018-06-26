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
