class PhysicalCondition < ActiveHash::Base
  self.data = [
    { id: 1, name: '元気に過ごせました' },
    { id: 2, name: '少し泣いてしまいましたが、それ以外は元気に過ごせました' },
    { id: 3, name: '元気はありましたが、いつもと様子が違ったので詳細を特記事項でお伝えします' },
    { id: 4, name: '元気がありませんでした。詳細は特記事項でお伝えします' },
    { id: 5, name: '' }
  ]

  include ActiveHash::Associations
  has_many :teacher_messages

  end