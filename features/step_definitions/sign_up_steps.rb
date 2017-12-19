Given("I am on the home page") do
  visit root_path
end
When("I fill in the form with valid data") do
  fill_in 'Name', with: "Random name"
  fill_in 'Email', with: "random.mail@gmail.com"
  fill_in 'Password', with: "RandomPassword"
end
Then("I should create my account") do
  expect(page).to have_content(@name)
  expect(page).to have_content(@email)
end

When("I leave the {string} field blank") do |string|
  fill_in string, with: ""
end

Then("I should see an error message") do
  expect(page).to have_css('#error_explanation')
end
