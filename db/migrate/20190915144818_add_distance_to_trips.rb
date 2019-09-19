class AddDistanceToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :distance, :integer
  end
end
