class CreateRequestRecords < ActiveRecord::Migration
  def change
    create_table :request_records do |t|

      t.string :token
      t.string :service_id
      t.belongs_to :user
    end
  end
end
