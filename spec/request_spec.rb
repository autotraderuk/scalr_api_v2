require 'spec_helper'

describe 'ScalrApiV2::Request' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Request.new
    end
  end

  it '.request returns parsed json' do
    request = subject.request('GET', '/api/v1beta0/user/1/scripts/')
    expect(request['data'][0]['id']).to eq(1)
    expect(request['data'][1]['id']).to eq(2)
    expect(request['data'][2]['id']).to eq(3)
  end

  it '.list returns parsed json' do
    request = subject.list('/api/v1beta0/user/1/scripts/')
    expect(request[0]['id']).to eq(1)
    expect(request[1]['id']).to eq(2)
    expect(request[2]['id']).to eq(3)
  end

  # TODO: test other methods
end
