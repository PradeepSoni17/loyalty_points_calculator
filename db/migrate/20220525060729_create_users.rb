class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.date :date_of_birth
      t.float :total_spends, default: 0.0
      t.integer :loyalty_points_earned, default: 0
      t.string :tier, default: 'Standard'
      t.timestamps
    end
  end
end
