class LoyaltyPointsController < ApplicationController

def process_points
  user = find_current_user
  puts "User is #{user}"
  user.calculate_points_and_rewards
  render json: user
end	

def find_current_user
   User.find(loyalty_points_params[:user_id])
end

 private

 def loyalty_points_params
   params.permit(:user_id)
 end 

end
