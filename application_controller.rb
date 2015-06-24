require 'bundler'
Bundler.require
require_relative 'models/homepage_API.rb'
require_relative 'models/song.rb'
require_relative 'models/youtube_scraper.rb'

class ApplicationController < Sinatra::Base

  get '/' do
  	erb :homepage
  end

  post '/results' do
	results = HomepageAPI.new(params["genre"])
	@genre_is = results.what_is_genre
	@both = results.song_video_hash
	@sim_genres = results.find_similar_genres
	@descrip = results.find_description
	@random = results.find_random
	erb :results_page
  end

end