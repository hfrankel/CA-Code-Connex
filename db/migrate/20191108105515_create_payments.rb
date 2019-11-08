class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :session, foreign_key: true
      t.references :user, foreign_key: true
      t.references :tutor, foreign_key: true
      t.integer :cost
      t.string :stripe_id

      t.timestamps
    end
  end
end
