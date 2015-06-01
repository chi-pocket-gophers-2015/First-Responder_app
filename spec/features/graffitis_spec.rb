require 'rails_helper'

RSpec.feature "Graffiti", :type => :feature do

	scenario "User clicks graffiti button" do
		visit "requests/new"
		click_button "Graffiti"
		expect(current_path).to eq('/graffitis/new')
	end

  # scenario "User creates a new widget" do
  #   visit "/widgets/new"

  #   fill_in "Name", :with => "My Widget"
  #   click_button "Create Widget"

  #   expect(page).to have_text("Widget was successfully created.")
  # end
end