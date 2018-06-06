class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :leaguename
      t.integer :server, default: 0
      t.references :team, index: true, foreign_key: true
      t.references :google_user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
