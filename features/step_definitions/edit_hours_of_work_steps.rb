And("I want to edit an hour of work")do
  click_on "Edit#{Hour.first.id}"
end

When("I change the {string} to empty") do |string|
  fill_in string , with: ""
end

When("I change the client field to empty") do
  select "", from: 'hour[client_id]'
end
