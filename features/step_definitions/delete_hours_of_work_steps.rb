Given("I am on the hours of work list") do
  visit hours_path
end
When("I click on {string} hour") do |string|
  @hour=@client.hours.first
  click_on "#{string}[#{@hour.id}]"
end
Then("I should not see that hour on my hour list") do
  visit hours_path
  expect(page).to_not have_content(@hour.description)
end
