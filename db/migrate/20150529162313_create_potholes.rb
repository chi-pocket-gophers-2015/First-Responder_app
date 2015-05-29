class CreatePotholes < ActiveRecord::Migration
  def change
    create_table :potholes do |t|
      t.text    :description
      t.string  :where_located
      t.string  :location
      t.integer :lat
      t.integer :long
      t.string  :address
      t.timestamps null: false
    end
  end
end
