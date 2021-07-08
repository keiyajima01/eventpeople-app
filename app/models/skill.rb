class Skill < ActiveHash::Base
  self.data = [
  { id: "", name: '指定なし' },
  { id: 1, name: 'スクール初心者' },
  { id: 2, name: 'スクール初級者 / オフ系初心者' },
  { id: 3, name: 'スクール初中級 / オフ系初級者' },
  { id: 4, name: 'スクール中級 / オフ系初中級' },
  { id: 5, name: 'スクール中上級 / オフ系中級' },
  { id: 6, name: 'スクール上級 / オフ系中上級' },
  { id: 7, name: '上級以上' }
]

include ActiveHash::Associations
has_many :events
end