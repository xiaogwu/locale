class HomeController < ApplicationController
  include HomeHelper

  def index
  end

  def map
  end

  def twitter
    @lat_lng = get_position
    # place = Twitter.geo_search({lat: 37.779894, long:-122.394879, granularity: "poi", accuracy: "1ft"})
    place = Twitter.geo_search({lat: @lat_lng[0], long:@lat_lng[1], granularity: "poi", accuracy: "1ft"})
    nh_id = place.first.attrs[:contained_within].first[:id]
    @tweets = Twitter.search("place:#{nh_id}").attrs[:statuses]
  end

  def instagram
    seven_days_ago = get_seven_days_ago_in_unix_time
    @photos = Instagram.get("media/search?lat=48.858844&lng=2.294351&distance=500&max_timestamp=#{seven_days_ago}&?access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
  end

  def foursquare
    client = initialize_foursquare_client
    @trending_venues = client.trending_venues('37.76,-122.42', :limit => 50, :radius => 2500) 
  end
 
end
