class User < ApplicationRecord
  belongs_to :team
  has_secure_password

  def stats(user)
    bs = BackendService.new()
    stats = bs.solo_stats(user.username)
  end
end
