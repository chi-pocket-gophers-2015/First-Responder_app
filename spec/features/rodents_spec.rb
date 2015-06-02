require 'rails_helper'

RSpec.feature "Rodents", :type => :feature do

	scenario "User clicks rodents button" do
		visit "requests/new"
		click_button "Rodents"
		expect(current_path).to eq('/rodents/new')
		# click_button "Mark Location"
	end

	# describe 'some stuff which requires js', :js => true do
	#   it 'will use the default js driver'
	#   it 'will switch to one specific driver', :driver => :webkit
	# end

	scenario "User clicks submit on map with default value" do
		visit "/rodents/form"
		fill_in "Description", :with => "Rat kind lair"
		# fill_in "vehicle_license", :with => "totally gross"
		# fill_in "vehicle_days_parked", :with => "1000"
		# select('Unknown', :from => 'vehicle_color')
		click_button "Submit"
		expect(page).to have_content 'Rodent Baiting'
	end

  # scenario "User creates a new widget" do
  #   visit "/widgets/new"

  #   fill_in "Name", :with => "My Widget"
  #   click_button "Create Widget"

  #   expect(page).to have_text("Widget was successfully created.")
  # end
end