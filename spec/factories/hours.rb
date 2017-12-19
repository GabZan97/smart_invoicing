FactoryBot.define do
  factory :hour do
    date  Date.parse("2017-1-1")
    start_time Time.parse("15:00:00")
    end_time Time.parse("16:20:00")
    sequence(:description) {|n| "Activity #{n}"}
    user
    client
    #invoice_id nil
  end
end
