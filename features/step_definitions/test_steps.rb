# Given(/^`scalr_api_v(\d+) scripts list` \#do$/) do |arg1|
# stub_request(:any, 'test.scalr.local').to_rack(FakeScalr)
#   body = CGI::unescape(request.body)
#   code = body.match(/<CODE_NBR>(.*)<\/CODE_NBR>/)
#   response = IO.read("#{RAILS_ROOT}/test/responses/#{code[1]}.xml")
#   {:body => response, :status => 200}
# end
# end

# Then(/^I should see "([^"]*)"$/) do |arg1|
#  expect(stub_request(:any, 'test.scalr.local').to_rack(FakeScalr)).to  match(Regexp.new(Regexp.escape(text)))
# end
