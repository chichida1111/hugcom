FactoryBot.define do
  factory :teacher_user do
    email                 { Faker::Internet.free_email }
    password              { "hoge1234" }
    password_confirmation { password }
    last_name_t_j         { '名字' }
    first_name_t_j        { '名前' }
    last_name_t_k         { 'ナマエ' }
    first_name_t_k        { 'ミョウジ' }
    group_id              { 2 }
  end
end