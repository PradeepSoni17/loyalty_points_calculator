class CreateUserRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rewards do |t|
      t.references :user, foreign_key: true
      t.integer :reward_points
      t.string :reward_earned
      t.timestamps
    end
  end
end
