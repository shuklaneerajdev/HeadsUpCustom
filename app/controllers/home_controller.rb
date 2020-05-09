require 'redis'

class HomeController < ApplicationController
  def default
    redis = Redis.new(host: "localhost")
    @movie = redis.get("movie")
  end
end
