FactoryBot.define do
  factory :client do
    sequence(:name) {|n| "randomclient#{n}"}
    sequence(:email) {|n| "randomclient#{n}@gmail.com"}
    codice_fiscale "randomone"
    partita_iva 123456789
    user
  end
end
