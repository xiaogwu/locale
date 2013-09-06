module PostsHelper

  def lat_range(lat)
    delta = 0.017999
    return (lat - delta)..(lat + delta)
  end

  def lng_range(lng)
    delta = 0.017999
    return (lng - delta)..(lng + delta)
  end
end
