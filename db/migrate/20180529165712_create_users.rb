class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :leaguename
      t.string :email
      t.integer :server, default: 0
      t.string :password_digest
      t.boolean :active, default: false
      t.references :team, index: true, foreign_key: true
      t.timestamps
    end
  end
end
