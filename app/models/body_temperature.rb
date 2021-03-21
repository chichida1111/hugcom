class BodyTemperature < ActiveHash::Base
  self.data = [
    { id: 1, name: '37.5°以下です' },
    { id: 2, name: '37.5°以上です' }
  ]

  include ActiveHash::Associations
  has_many :parent_messages


end