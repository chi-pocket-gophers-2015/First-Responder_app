require 'rails_helper'

RSpec.feature "Graffiti", :type => :feature do

	scenario "User clicks graffiti button" do
		visit "requests/new"
		click_button "Graffiti"
		# expect(current_path).to eq('/graffitis/new')
		# click_button "Mark Location"
	end

	# describe 'some stuff which requires js', :js => true do
	#   it 'will use the default js driver'
	#   it 'will switch to one specific driver', :driver => :webkit
	# end

	scenario "User clicks submit on map with default value" do
		visit "/graffitis/form"
		fill_in "Description", :with => "It's a big graffiti, I don't know."
		select('Limestone', :from => 'surface_type')
		click_button "Submit"
		expect(page).to have_content 'Graffiti Removal'
	end

  # scenario "User creates a new widget" do
  #   visit "/widgets/new"

  #   fill_in "Name", :with => "My Widget"
  #   click_button "Create Widget"

  #   expect(page).to have_text("Widget was successfully created.")
  # end
end