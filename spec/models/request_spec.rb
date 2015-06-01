require 'rails_helper'

RSpec.describe Request, type: :model do
  it '#official_city_data should return a hash' do
    token = '556ba55dff03c04034a04e80'
    request = Request.official_city_data(token)
    expect(request).to be_a Hash
  end

  it '#official_city_data should have an open status' do
    token = '556ba55dff03c04034a04e80'
    request = Request.official_city_data(token)
    expect(request['status']).to eq('open')
  end

  it '#filter_params should return a hash' do
    params = {status: 'Submitted'}
    request = Request.filter_params(params)
    expect(request).to be_a Hash
  end
end
