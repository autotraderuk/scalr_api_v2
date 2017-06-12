require 'spec_helper'

describe 'ScalrApiV2::Farms.list' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Farms.new.list
    end
  end

  # list method tests
  it '.list returns an array' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Array)
  end

  it '.list returns stubbed data from fakeScalr' do
    expect(subject[0]['id']).to eq(1)
    expect(subject[1]['id']).to eq(2)
    expect(subject[2]['id']).to eq(3)
  end
end

describe 'ScalrApiV2::Farms.get_farm' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Farms.new.get_farm(100)
    end
  end

  # list method tests
  it '.get_farm returns an array' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Array)
  end

  it '.get_farm returns stubbed data from fakeScalr' do
    expect(subject[0]['id']).to eq(1)
  end
end

describe 'ScalrApiV2::Farms.list_farm_servers' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Farms.new.list_farm_servers(101)
    end
  end

  # list method tests
  it '.list_farm_servers returns an array' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Array)
  end

  it '.list_farm_servers returns stubbed data from fakeScalr' do
    expect(subject[0]['id']).to eq(1)
    expect(subject[1]['id']).to eq(2)
    expect(subject[2]['id']).to eq(3)
  end
end
