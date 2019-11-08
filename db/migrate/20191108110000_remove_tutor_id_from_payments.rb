class RemoveTutorIdFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :tutor_id, :integer
  end
end
