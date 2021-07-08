FactoryBot.define do
  setup
  

  factory :event do
    sequence(:name) {|i| "イベント名#{i}" }
    type_id { rand(1..3) }
    date_open { rand(1..30).days.from_now }
    date_close { date_open + rand(1..30).hours }
    pref_id { rand(1..30) }
    sequence(:place) {|i| "イベント開催場所#{i}" }
    price { rand(500..5000) }
    sequence(:price_detail) {|i| "イベント詳細#{i}" }
    needed_skill { rand(1..3) }
    sequence(:memo) {|i| "テキストメモ#{i}" }
  end
end
