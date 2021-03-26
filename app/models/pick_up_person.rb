class PickUpPerson < ActiveHash::Base
  self.data = [
    { id: 1, name: 'いつも通りです' },
    { id: 2, name: '事前登録している人物が行きます' },
    { id: 3, name: '登録外の人物が行きます' },
    { id: 4, name: '' }
  ]

  include ActiveHash::Associations
  has_many :parent_messages


  end