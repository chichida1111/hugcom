class PickUpTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '18時までに迎えにいく予定です' },
    { id: 2, name: '18時以降の延長保育をお願いします' },
    { id: 3, name: '' }
  ]

  include ActiveHash::Associations
  has_many :parent_messages


  end