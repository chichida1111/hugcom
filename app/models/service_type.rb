class ServiceType < ActiveHash::Base
  self.data = [
    { id: 1, name: '--',        },
    { id: 2, name: '延長保育/回'  },
    { id: 3, name: '延長保育/月額'},
    { id: 4, name: '給食費/月'   },
    { id: 5, name: 'おやつ代/月'  }
  ]

  include ActiveHash::Associations
  has_many :services


  end