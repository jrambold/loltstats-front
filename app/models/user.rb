class User < ApplicationRecord
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_secure_password

  def stats(user)
    bs = BackendService.new()
    stats = bs.solo_stats(user.username)
  end
end
