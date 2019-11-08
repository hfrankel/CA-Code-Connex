class RemoveStripeFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :stripe, :string
  end
end
