require 'redis'

class HomeController < ApplicationController
  def default
    @movie = Movie.where(is_used: false).order('RANDOM()').first
    @movie.is_used = true
    @movie.save
  end
end
