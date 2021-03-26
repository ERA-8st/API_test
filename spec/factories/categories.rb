FactoryBot.define do
  factory :category do
    name { "test" }
  end

  factory :category2, class: Category do
    name { "test2" }
  end

end
