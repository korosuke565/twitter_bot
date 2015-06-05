require 'twitter' 

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.access_token = ""
  config.access_token_secret = ""
end

# ユーザーidを自分のidに変える
user = @OgiBot_777

follower_ids = []
client.follower_ids(user).each do |id|
  follower_ids.push(id)
end

friend_ids = []
client.friend_ids(user).each do |id|
  friend_ids.push(id)
end

unfollower = friend_ids - follower_ids 

if unfollower.size < 21
  client.unfollow(unfollower)
else
  while unfollower.size > 21 do
    unfollower.pop
  end
  client.unfollow(unfollower)
end
