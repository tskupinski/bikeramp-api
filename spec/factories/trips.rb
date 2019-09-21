FactoryBot.define do
  factory :trip do
    start_address { 'Example Address 1' }
    destination_address { 'Example Address 2' }
    price { 10 }
    date { Date.today }
    distance { 1000 }
  end
end
