Given("I am on my {string} list") do |string|
  click_on "#{string}s"
  click_on "#{string} List"
end
And("I click on {string}") do |string|
  click_on string
end
When("I fill the client form with valid data") do
  fill_in 'Name', with: "Random name"
  fill_in 'Codice fiscale', with: "Random CF"
  fill_in 'Email', with: "random.mail@gmail.com"
  fill_in 'Partita iva', with: "IT0123456789"
end
Then("I should see the new client in the list") do
  client= Client.last
  expect(page).to have_content(client.name)
end

When("I fill in the add new client form with a blank name") do
  fill_in 'Name', with: ''
  fill_in 'Codice fiscale', with: ('a'..'z').to_a.shuffle.join
  fill_in 'Email', with: ('a'..'z').to_a.shuffle.join + "@gmail.com"
  fill_in 'Partita iva', with: 123123
end

When("I fill in the add new client form with a blank codice fiscale") do
  fill_in 'Name', with: 'ciao'
  fill_in 'Codice fiscale', with: ''
  fill_in 'Email', with: ('a'..'z').to_a.shuffle.join + "@gmail.com"
  fill_in 'Partita iva', with: 123123
end

When("I fill in the add new client form with a blank email") do
  fill_in 'Name', with: 'ciao'
  fill_in 'Codice fiscale', with: 'kjhkhk'
  fill_in 'Email', with: ''
  fill_in 'Partita iva', with: 123123
end

When("I fill in the add new client form with a blank partita iva") do
  fill_in 'Name', with: 'ciao'
  fill_in 'Codice fiscale', with: 'l;k;lk;k;'
  fill_in 'Email', with: ('a'..'z').to_a.shuffle.join + "@gmail.com"
  fill_in 'Partita iva', with: nil
end
