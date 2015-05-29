class CreatePotholes < ActiveRecord::Migration
  def change
    create_table :potholes do |t|

      t.timestamps null: false
    end
  end
end
