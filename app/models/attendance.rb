class Attendance < ActiveHash::Base
  self.data = [
    { id: 1, name: '出席します' },
    { id: 2, name: '5分ぐらい遅刻します' },
    { id: 3, name: '10分以上、遅刻します' },
    { id: 4, name: '欠席します' },
    { id: 5, name: '' }
  ]

  include ActiveHash::Associations
  has_many :parent_messages


end