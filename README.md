# unfollow.rb

## はじめに
### 仕様
自分がフォローしているが、相手がフォローしていないユーザーを20件リムーブする。
一度に大量にリムーブするとアカウトを凍結される恐れがあるため、20件に制限した。


### 使い方
1. Twitter Developerサイトでアプリ登録をし、アクセストークンを取得
[Twitter Developers](https://dev.twitter.com/)
1. 取得後は下記空欄の部分に必要なkeyを入力
1. ユーザーidを自分の登録したTwitterアカウントに変更
1. $ ruby unfollow.rbで実行

```ruby
require 'twitter'

client = Twitter::REST::Client.new do |config|
  # developerサイトで取得したトークンを入力
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

```
