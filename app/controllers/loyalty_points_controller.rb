class LoyaltyPointsController < ApplicationController

def process
  user = find_current_user
  user.calculate_points_and_rewards
end	

def find_current_user
    User.find(params[:user_id])
 end

end
