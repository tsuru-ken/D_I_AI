FactoryBot.define do

  factory :user do
    name { "takeshi" }
    email { "example@example.com" }
    password { "password" }
    # profile { "私のプロフィール" }
    admin { false }
  end
  factory :secound_user, class:User do
    name { "takayuki" }
    email { "takayuki@example.com" }
    password { "password" }
    # profile { "僕のプロフィール" }
    admin { false }
  end
  factory :third_user, class:User do
    name { "アドミンつるけん" }
    email { "admin@admin.com" }
    password { "123456" }
    # profile { "三恵プロフィール" }
    admin { true }
  end

  factory :four_user , class:User do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end