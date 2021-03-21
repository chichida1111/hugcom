class Defecation < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ウンチをしました' },
    { id: 2, name: 'ウンチしませんでした' }
  ]

  include ActiveHash::Associations
  has_many :teacher_messages


  end