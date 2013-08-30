class HomeController < ApplicationController
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
  end

  def foursquare
  end

end
