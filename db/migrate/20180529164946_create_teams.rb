class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team
      t.integer :server, default: 0
      t.timestamps
    end
  end
end
