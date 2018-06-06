class GoogleUser < ApplicationRecord
  validates_presence_of :name, :email, :google_sso_token
  validates_uniqueness_of :email

  has_many :users
  has_many :teams, through: :users

  def self.update_or_create(auth)
    user = GoogleUser.find_by(email: auth['info']['email']) || GoogleUser.new
    user.attributes = {
      name: auth['info']['first_name'] + ' ' + auth['info']['last_name'],
      email: auth['info']['email'],
      google_sso_token: auth['credentials']['token']
    }
    user.save!
    user
  end
end
