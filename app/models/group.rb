class Group < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'いちご' },
    { id: 3, name: 'みかん' },
    { id: 4, name: 'もも' },
    { id: 5, name: 'りんご' },
    { id: 6, name: 'ぶどう' },
    { id: 7, name: 'すいか' }
  ]

  include ActiveHash::Associations
  has_many :contacts
  has_many :parent_user
  has_many :teacher_user

  end