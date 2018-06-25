class User < ApplicationRecord
  belongs_to :team
  belongs_to :google_user

  after_create do |user|
    add_user(user)
  end

  before_destroy do |user|
    delete_user(user)
  end

  def solo_stats
    backend = Backend.new
    backend.solo_stats(self)
  end

  def flex_stats
    backend = Backend.new
    backend.single_player_flex_stats(self)
  end

  def update
    backend = Backend.new
    backend.update_solo_matches(self)
    backend.update_team_flex_matches(self.team)
  end

  private
    def add_user(user)
      backend = Backend.new
      backend.add_teammember(user)
    end

    def delete_user(user)
      backend = Backend.new
      backend.delete_teammember(user)
    end

end
