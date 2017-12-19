Given("I have hours of work") do
  @hour=FactoryBot.create(:hour, user:@user, client:@client)
end

Then("I should see my hours of work list") do
  expect(page).to have_content(@hour.date)
end

Given("I don't have hours of work") do
  Hour.all.each do |hour|
    hour.destroy
  end
end
Then("I should not see any hours of work") do
  expect(page).to_not have_link("Show")
end
