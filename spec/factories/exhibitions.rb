FactoryBot.define do
  factory :exhibition do
    name                    {"自転車"}
    explanatory             {"未使用のクロスバイクです"}
    category_id             {"1"}
    status                  {"新品・未使用"}
    cost                    {"送料込み（出品者負担)"}
    prefecture_code         {"1"}
    day                     {"4〜7日で発送"}
    price                   {"300"}
    user_id                 {"2"}
    brand_id                {"1"}
    # trait :invalid do
    #   name                  {""}
    # # end
    # created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

  
end
