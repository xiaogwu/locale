class AddLatLngToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :lat, :float
    add_column :posts, :lng, :float
  end
end
