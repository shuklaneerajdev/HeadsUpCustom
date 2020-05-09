require 'redis'
redis = Redis.new(host: "localhost")

while true
  puts "should I toggle the redis value?"
  input = gets.chomp
  if input == "y"
    redis.set('update_movie', true)
  end
end
