class CreateUserTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_transactions do |t|
      t.references :user, foreign_key: true
      t.decimal :total_spends 
      t.timestamps
    end
  end
end
