FactoryBot.define do
  factory :parent_user do
    email                 { Faker::Internet.free_email }
    password              { "hoge1234" }
    password_confirmation { password }
    phone_number          { "09012345678"}
    last_name_p_j         { '名字' }
    first_name_p_j        { '名前' }
    last_name_p_k         { 'ナマエ' }
    first_name_p_k        { 'ミョウジ' }
    group_id              { 2 }
  end
end