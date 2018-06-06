class CreateGoogleUser < ActiveRecord::Migration[5.2]
  def change
    create_table :google_users do |t|
      t.string :name
      t.string :email
      t.text :google_sso_token

      t.timestamps
    end
  end
end
