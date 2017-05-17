require 'spec_helper'

describe 'ScalrApiV2::Scripts.list' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.list
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

describe 'ScalrApiV2::Scripts.versions' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.versions
    end
  end

  # versions method tests
  it '.versions returns an array' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Array)
  end

  it '.versions returns stubbed data from fakeScalr' do
    expect(subject[0]['version']).to eq(1)
    expect(subject[1]['version']).to eq(2)
  end
end

describe 'ScalrApiV2::Scriptsi.create' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.create({ 'blockingDefault' => 'true', 'description' => 'string', 'name' => 'newscript', 'osType' => 'linux', 'timeoutDefault' => 1 })
    end
  end

  # create method tests
  it '.create returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.create returns stubbed data from fakeScalr' do
    expect(subject['name']).to eq('newscript')
    expect(subject['osType']).to eq('linux')
  end
end

describe 'ScalrApiV2::Scriptsi.create_version' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.create_version(1, { 'body' => '#!/bin/bash', 'script' => { 'id' => 1 }, 'version' => 1 })
    end
  end

  # create version method tests
  it '.create_version returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.create_version returns stubbed data from fakeScalr' do
    expect(subject['body']).to eq('#!/bin/bash')
  end
end

describe 'ScalrApiV2::Scripts.update_version' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.update_version(1, 1, { 'body' => '#!/bin/bash\necho "hello world"' })
    end
  end

  # create version method tests
  it '.update_version returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.update_version returns stubbed data from fakeScalr' do
    expect(subject['body']).to eq('#!/bin/bash\necho "hello world"')
  end
end

describe 'ScalrApiV2::Scripts.execute' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.execute(1, { 'blocking' => true, 'server' => { 'id' => 'string' }, 'timeout' => 1 })
    end
  end

  # create version method tests
  it '.execute returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.execute returns stubbed data from fakeScalr' do
    expect(subject['status']).to eq('running')
  end
end

describe 'ScalrApiV2::Scripts.execute_version' do
  subject do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      ScalrApiV2::Scripts.new.execute_version(1, 1, { 'blocking' => true, 'server' => { 'id' => 'string' }, 'timeout' => 1 })
    end
  end

  # create version method tests
  it '.execute_version returns a hash' do
    expect(subject).not_to be nil
    expect(subject).to be_kind_of(Hash)
  end

  it '.execute_version returns stubbed data from fakeScalr' do
    expect(subject['status']).to eq('running')
  end
end
