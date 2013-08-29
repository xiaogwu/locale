class HomeController < ApplicationController
  include HomeHelper

  def index
  end

  def map
  end

  def twitter
  end

  def instagram
  @photos = Instagram.get("media/search?lat=48.858844&lng=2.294351&distance=500&max_timestamp=1377240262&?access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
  end

  def foursquare
  end

end
