class User < ApplicationRecord
  has_many :userteams
  has_many :teams, through: :userteams

end
