FactoryBot.define do
  factory :user do    #aliases: [:owner] doで別名でも作成可能
    nickname          {Faker::Name.initials(number: 2)}
    mail              {Faker::Internet.email}
    password          {'111aaa'}
    password_confirmation {password}
    last_name         {Gimei.last.kanji }
    first_name        {Gimei.first.kanji }
    birthday          {Faker::Date.between(from: '1930-01-01', to: '2020-12-31')}
    address           {Gimei.address.kanji + "1 - 1 - 1"}
    memo              {"a" * 200}
  end
end
