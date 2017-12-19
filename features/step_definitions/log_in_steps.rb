Given("I have an account") do
  @password="RandomPassword"
  @user=FactoryBot.create(:user, name:"randomuser", email:"random.mail@gmail.com", password: @password)
end

Given("I am on the login page") do
  visit login_path
end

When("I fill in the login form with valid data") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @password
end
Then("I should log in to my account") do
  expect(page).to have_content("Clients")
end

When("I leave the email field blank") do
  fill_in 'Email', with: ''
  fill_in 'Password', with: @password
end
Then("I should get an error message") do
  expect(page).to have_content("Invalid email/password combination")
end

When("I leave the password field blank") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: ''
end

When("I enter an invalid email") do
  fill_in 'Email', with: 'another.mail@gmail.com'
  fill_in 'Password', with: @password
end

When("I enter an invalid password") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'anotherpassword'
end
