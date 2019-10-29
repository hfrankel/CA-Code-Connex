class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.text :comment
      t.references :session, foreign_key: true
      t.references :tutor, foreign_key: true

      t.timestamps
    end
  end
end
