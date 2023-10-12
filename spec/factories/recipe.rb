FactoryBot.define do
  factory :recipe do
    name { 'Recipe Ex1' }
    preparation_time { 2 }
    cooking_time { 1 }
    description { 'Steps here' }
    public { true }
    user
  end
end
