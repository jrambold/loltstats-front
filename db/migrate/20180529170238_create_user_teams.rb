class CreateUserTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_teams do |t|
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
