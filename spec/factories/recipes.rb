FactoryBot.define do
  factory :recipe do
    name { 'Recipe Ex1' }
    public { true }
    user
  end
end
