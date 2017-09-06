require 'spec_helper'

describe 'ScalrApiV2::Roles.list' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Roles.new.list
    end
  end

  # list method tests
  it '.list returns an array' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Array)
  end

  it '.list returns stubbed data from fakeScalr' do
    expect(subject[0]['id']).to eq('1')
    expect(subject[1]['id']).to eq('2')
  end
end

describe 'ScalrApiV2::Roles.create' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Roles.new.create({ 'builtinAutomation' => %w[base chef], 'category' => { 'id' => 1 }, 'name' => 'apirolemike', 'os' => { 'id' => 'centos-7-x' } })
    end
  end

  # create method tests
  it '.create returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.create returns stubbed data from fakeScalr' do
    expect(subject['name']).to eq('newrole1')
    expect(subject['os']['id']).to eq('centos-7-x')
  end
end

describe 'ScalrApiV2::Roles.list_images' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Roles.new.list_images(1)
    end
  end

  # list_images method tests
  it '.list returns an array' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Array)
  end

  it '.list returns stubbed data from fakeScalr' do
    expect(subject[0]['image']['id']).to eq('1')
    expect(subject[0]['role']['id']).to eq(1)
  end
end

describe 'ScalrApiV2::Roles.associate_image' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Roles.new.associate_image(1, { 'image' => { 'id' => '1' }, 'role' => { 'id' => 1 } })
    end
  end

  # create method tests
  it '.create returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.create returns stubbed data from fakeScalr' do
    expect(subject['image']['id']).to eq('1')
    expect(subject['role']['id']).to eq(1)
  end
end
