class AddCurrencyToUserTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :user_transactions, :currency, :string, default: 'INR'
  end
end
