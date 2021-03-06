class User < ApplicationRecord
 has_many :user_rewards
 has_many :user_transactions
    
def calculate_points_and_rewards        
    #reward point_calculation
    total_spends_inr = self.user_transactions.where(currency: 'INR').sum(:total_spends)
    total_spends_other_currency = self.user_transactions.where.not(currency: 'INR').sum(:total_spends)
    inr_points = (total_spends_inr/100).to_i
    other_currency_points = (total_spends_other_currency/100).to_i
    total_reward_points = inr_points + other_currency_points * 2 

    #Assign user Tier 
    total_earned_reward_points = self.user_rewards.sum(:reward_points)
    if total_earned_reward_points >= 5000
      tier = 'Platinum'
    elsif(total_earned_reward_points >= 1000 and total_earned_reward_points < 5000)
      tier = 'Gold'
    else
      tier = 'Standard'
    end

    #Reward calculation    
     last_two_cycle_transactions = self.user_transactions.where('DATE(created_at) >= ?', Date.today.end_of_month.days_ago(60)) 
     if last_two_cycle_transactions.sum(:total_spends) > 1000
       eligible_for_tier_update = true
     end

     if Date.parse(self.date_of_birth.to_s).month == Date.today.month
        eligible_for_free_cofee_reward = true        
     end
     
    self.save!

 end
end
