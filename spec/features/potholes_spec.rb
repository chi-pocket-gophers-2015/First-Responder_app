RSpec.feature "Pothole", :type => :feature do

	scenario "User clicks pothole button" do
		visit "requests/new"
		click_button "Pothole"
		expect(current_path).to eq('/potholes/new')
		# click_button "Mark Location"
	end

	# describe 'some stuff which requires js', :js => true do
	#   it 'will use the default js driver'
	#   it 'will switch to one specific driver', :driver => :webkit
	# end

# not working yet
	# scenario "User clicks submit on map with default value" do
	# 	visit "/potholes/form"
	# 	fill_in "Description", :with => "gate to hell"
	# 	select('Limestone', :from => 'surface_type')
	# 	click_button "Submit"
	# 	expect(page).to have_content 'Graffiti Removal'
	# end

end