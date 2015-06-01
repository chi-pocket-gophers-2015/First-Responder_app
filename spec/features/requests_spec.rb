require 'rails_helper'

feature 'Potholes report page' do

  scenario 'to have a map' do
    visit new_potholes_path
    expect(page).to have_css('#map-canvas')
  end

  # scenario 'mark location link to go to form' do
  #   visit new_potholes_path
  #   click_button('Mark Location')
  #   expect(page).to have_content('describe')
  # end

end