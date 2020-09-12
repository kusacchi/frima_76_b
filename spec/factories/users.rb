FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    nickname {Faker::Name.last_name}
    email {"hiro@example.com"}
    password {"asdf1234"}
    password_confirmation {"asdf1234"}
    birthday {"1989-01-01"}
    family_name {"上杉"}
    first_name {"謙信"}
    family_name_kana {"ウエスギ"}
    first_name_kana {"ケンシン"}
  end 
end