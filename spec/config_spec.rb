require 'spec_helper'

describe 'ScalrApiV2::Config' do
  describe "with ENV variables SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1'" do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      config = ScalrApiV2::Config.new.config

      it 'should return a hash' do
        expect(config).not_to be nil
        expect(config).to be_kind_of(Hash)
      end

      it 'should set url' do
        expect(config['url']).to match('https://test.scalr.local')
      end

      it 'should set key_id' do
        expect(config['key_id']).to match('1234')
      end

      it 'should set key_secret' do
        expect(config['key_secret']).to match('5678')
      end
    end
  end

  describe "with ENV variables SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1'" do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      config = ScalrApiV2::Config.new.config
      it 'should set env_id' do
        expect(config['env_id']).to match('1')
      end
    end
  end

  describe 'with missing ENV SCALR_URL' do
    with_modified_env SCALR_URL: nil, SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      it 'should raise exception' do
        expect { ScalrApiV2::Config.new.config }.to raise_error('Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET, SCALR_ENV_ID')
      end
    end
  end

  describe 'with missing ENV SCALR_KEY_ID' do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: nil, SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: '1' do
      it 'should raise exception' do
        expect { ScalrApiV2::Config.new.config }.to raise_error('Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET, SCALR_ENV_ID')
      end
    end
  end

  describe 'with missing ENV SCALR_KEY_SECRET' do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: nil, SCALR_ENV_ID: '1' do
      it 'should raise exception' do
        expect { ScalrApiV2::Config.new.config }.to raise_error('Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET, SCALR_ENV_ID')
      end
    end
  end

  describe 'with missing SCALR_ENV_ID' do
    with_modified_env SCALR_URL: 'https://test.scalr.local', SCALR_KEY_ID: '1234', SCALR_KEY_SECRET: '5678', SCALR_ENV_ID: nil do
      it 'should raise exception' do
        expect { ScalrApiV2::Config.new.config }.to raise_error('Missing Environment variables, please configure SCALR_URL, SCALR_KEY_ID, SCALR_KEY_SECRET, SCALR_ENV_ID')
      end
    end
  end
end
