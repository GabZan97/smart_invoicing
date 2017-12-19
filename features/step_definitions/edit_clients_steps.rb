And("I have at least a client") do
  @client=FactoryBot.create(:client, name: "Random Name", user:@user)
end

When("I change the client's name to some other name") do
  fill_in 'Name', with: "Very Random Name"
end

Then("The client should be updated") do
  expect(page).to have_content("Very Random Name")
end

When("I leave a field empty") do
  fill_in 'Email', with: ""
end

Given ("I am on my clients menu") do
  visit clients_path
end
And("I confirm the popup") do
  popup= page.driver.browser.switch_to.alert
  popup.accept
end
Then ("I should not see {string} on my client list") do |string|
  expect(page).to_not have_content(@client.name)
  expect(page).to_not have_content(@client.codice_fiscale)
  expect(page).to_not have_content(@client.email)
  expect(page).to_not have_content(@client.partita_iva)
end
And ("All the hours associated to that client should be destroyed") do
  visit hours_path
  @client.hours.each do |hour|
    expect(page).to_not have_content(hour.client.name)
    expect(page).to_not have_content(hour.description)
  end
end
And("All the invoices billed to that client should be destroyed") do
  visit invoices_path
  @invoices.each do |invoice|
    expect(page).to_not have_content(invoice.id)
  end
end
