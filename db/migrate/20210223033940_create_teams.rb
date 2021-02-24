class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :username, null: false
      t.index :username, unique: true
      t.string :name
      t.string :password_digest, null: false
      t.text :desc

      t.timestamps
    end
  end
end
