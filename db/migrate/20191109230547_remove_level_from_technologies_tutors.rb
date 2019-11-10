class RemoveLevelFromTechnologiesTutors < ActiveRecord::Migration[5.2]
  def change
    remove_column :technologies_tutors, :level, :integer
  end
end
