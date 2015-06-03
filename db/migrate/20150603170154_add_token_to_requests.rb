class AddTokenToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :token, :string
  end
end
