# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 (1..10).each do |number|
    user = User.new
    user.full_name = 'User' + number.to_s 
    user.email = 'user' + number.to_s + '@example.com'
    user.date_of_birth = "1990-1-#{number}"
    user.total_spends = Random.rand(500..10000)
    user.loyalty_points_earned = Random.rand(100..3000)
    user.save!
 end


['free_coffee_reward', '5_percent_cash_rebate_reward', 'free_movie_ticket_reward', 'airport_lounge_access_reward'].each do |reward_name|
  reward = Reward.new(reward_name: reward_name)
  reward.save!
end

#Initial reward points 
(1..10).each do |number|
    user_reward = UserReward.new
    user_reward.user_id = number
    user_reward.reward_points = Random.rand(50..1000)
    user_reward.save!
#  end

 (1..50).each do |number|
    user_trans = UserTransaction.new
    user_trans.user_id = Random.rand(1...10)
    user_trans.total_spends = Random.rand(50..1000)
    user_trans.save!
 end 
 