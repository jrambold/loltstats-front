class Team < ApplicationRecord
  has_many :userteams
  has_many :users, through: :userteams
end
