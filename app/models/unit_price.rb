class UnitPrice < ActiveHash::Base
  self.data = [
    { id: 1, unit_price: '--' },
    { id: 2, unit_price: 500 },
    { id: 3, unit_price: 2000},
    { id: 4, unit_price: 1200},
    { id: 5, unit_price: 300}
  ]

   include ActiveHash::Associations
   has_many :services


  end