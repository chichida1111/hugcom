FactoryBot.define do
  factory :contact do
    last_name_c_j         { '名字' }
    first_name_c_j        { '名前' }
    last_name_c_k         { 'ナマエ' }
    first_name_c_k        { 'ミョウジ' }
    group_id              { 2 }
    association :parent_user

    after(:build) do |contact|
      contact.image.attach(io: File.open('app/assets/images/KOSODATE_logo.png'), filename: 'KOSODATE_logo.png')
    end

  end
end