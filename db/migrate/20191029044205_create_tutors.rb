class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.integer :pricing
      t.integer :experience
      t.text :bio
      t.text :style
      t.boolean :active
      t.integer :maxduration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
