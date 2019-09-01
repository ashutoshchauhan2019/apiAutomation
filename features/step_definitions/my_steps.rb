include ApiRequest

Given(/^I like to holiday in "([^"]*)"$/) do |location|
  @url ="http://api.openweathermap.org/data/2.5/forecast?q=#{location},au&appid=77479295e2ec74ed0b40a6d64b4bac2d"
end

When(/^I look up the weather forecast$/) do
  get_api(@url)
end

Then(/^I receive the weather forecast$/) do
  api_response
end

And(/^I only like to holiday on Sunday$/) do
  filter_day
end

And(/^the temperature is warmer than ([^"]*) degrees$/) do |temperature|
  check_temperature(temperature)
end
