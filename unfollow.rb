require 'twitter' 

client = Twitter::REST::Client.new do |config|
  config.consumer_key = "YkOxIowIeUmhz5lARy7jeupgq"
  config.consumer_secret = "MTpiUrabcqDs5lH5HUnQWUbqbxaxNFqm5JE7tcKKZz3b9WJ7uv"
  config.access_token = "3022103192-iu6CD27PfznpZGlDhF2m6qBhnSHcoupCqSnwVPl"
  config.access_token_secret = "eUjPl6OKqSXPLEHF9OftrUmU5ZHG8DhqVnegGUq8f7Mj3"
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
