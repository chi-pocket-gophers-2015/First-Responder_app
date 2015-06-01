require 'rails_helper'

feature 'Potholes report page' do

  scenario 'to have a map' do
    visit new_potholes_path
    expect(page).to have_css('#map-canvas')
  end

  scenario 'to have a map' do
    visit new_potholes_path
    expect(page).to have_css('#map-canvas')
  end

end