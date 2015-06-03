class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string "Creation Date"
      t.string "Status"
      t.string "Completion Date"
      t.string "Service Request Number"
      t.string "Type of Service Request"
      t.string "Street Address"
      t.string "ZIP Code"
      t.string "Latitude"
      t.string "Longitude"
      t.string "Location"
    end
  end
end
