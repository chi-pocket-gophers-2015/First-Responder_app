class AddAttachmentImageToRequestRecords < ActiveRecord::Migration
  def self.up
    change_table :request_records do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :request_records, :image
  end
end
