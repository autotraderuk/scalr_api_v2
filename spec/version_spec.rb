require 'spec_helper'

describe 'ScalrApiV2::VERSION' do
  it 'should set a version number' do
    expect(ScalrApiV2::VERSION).not_to be nil
    expect(ScalrApiV2::VERSION).to match('0.2.2')
  end
end
