require 'redis'

class HomeController < ApplicationController
  def default
    redis = Redis.new(host: "localhost")
    should_update_movie = redis.get("update_movie")
    if should_update_movie == "true"
      movie = Movie.where(is_used: false).order('RANDOM()').first
      movie.is_used = true
      movie.save
      redis.set("movie_name", movie.title)
      @movie_name = movie.title
      redis.set("update_movie", false)
    else
      @movie_name = redis.get("movie_name")
    end
  end
end
