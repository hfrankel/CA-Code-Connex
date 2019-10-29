class CreateTechnologiesTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :technologies_tutors do |t|
      t.references :tutor, foreign_key: true
      t.references :technology, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
