class RemoveCostFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :cost, :integer
  end
end
