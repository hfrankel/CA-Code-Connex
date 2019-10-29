class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.datetime :timestamp
      t.integer :duration
      t.integer :cost
      t.string :stripe
      t.text :note
      t.references :tutor, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
