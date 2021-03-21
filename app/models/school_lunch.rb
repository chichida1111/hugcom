class SchoolLunch < ActiveHash::Base
  self.data = [
    { id: 1, name: '全部、食べられました' },
    { id: 2, name: '全部、食べて、おかわりもしました' },
    { id: 3, name: '少し残してしまいました' },
    { id: 4, name: 'ほとんど食べれませんでした' }
  ]

  include ActiveHash::Associations
  has_many :teacher_messages


  end