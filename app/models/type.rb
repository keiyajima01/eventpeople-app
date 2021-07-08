class Type < ActiveHash::Base
  self.data = [
    { id: "", name: '指定なし' },
    { id: 1, name: 'テニス' },
    { id: 2, name: '合コン/飲み会' },
    { id: 3, name: 'ドライブ/ツーリング' },
  ]

  include ActiveHash::Associations
  has_many :events
end