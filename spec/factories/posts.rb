FactoryBot.define do
  factory :post do
    title {"sample"}
    game {"rainbow six siege"}
    platform {"PC"}
    comment {"testtesttest"}
    association :user
  end
end
