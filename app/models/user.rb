class User < ApplicationRecord
 has_many :user_rewards
 has_many :user_transactions
    
def calculate_points_and_rewards
    total_spends = self.user_transactions.sum(:total_spends)
    
 end
end
