FactoryBot.define do
  factory :service do
    service_type_id { 2 }
    unit_price_id   { 2 }
    number_of_times { 2 }
    association :teacher_user
    association :contact
  end
end