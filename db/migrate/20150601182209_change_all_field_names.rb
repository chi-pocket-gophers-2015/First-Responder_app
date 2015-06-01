class ChangeAllFieldNames < ActiveRecord::Migration
  def change
    remove_column :requests, 'Creation Date'
    add_column :requests, :creation_date, :datetime
    remove_column :requests, 'Status'
    add_column :requests, :status, :string
    remove_column :requests, 'Completion Date'
    add_column :requests, :completion_date, :datetime
    remove_column :requests, 'Service Request Number'
    add_column :requests, :service_request_number, :string
    remove_column :requests, 'Type of Service Request'
    add_column :requests, :type_of_service_request, :string
    remove_column :requests, 'Street Address'
    add_column :requests, :street_address, :string
    remove_column :requests, 'ZIP Code'
    add_column :requests, :zip_code, :integer
    remove_column :requests, 'Latitude'
    add_column :requests, :latitude, :string
    remove_column :requests, 'Longitude'
    add_column :requests, :longitude, :string
    remove_column :requests, 'Location'
    add_column :requests, :location, :string
  end
end
