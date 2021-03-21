class Service < ApplicationRecord

  belongs_to :contact
  belongs_to :teacher_user
  has_one :service_order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :service_type
  belongs_to_active_hash :unit_price

  validates :service_type_id, presence: true, numericality: { other_than: 0 } 
  
  
  validates :number_of_times, presence: true

end