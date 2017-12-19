When("I fill the hours of work form with valid data") do
  select_date "2015,Jan,25", :from => "Date"
  select "#{Client.first.name}", from: 'hour[client_id]'
end
Then("I should see the details of the new hour") do
  hour=Hour.last
  expect(page).to have_content(hour.date.strftime("%y-%m-%d"))
  expect(page).to have_content(hour.user.name)
  expect(page).to have_content(hour.client.name)
end

When("I fill the hours of work form with an empty client field") do
  select_date "2015,Jan,25", :from => "Date"
end
