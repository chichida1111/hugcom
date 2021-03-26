class Service < ApplicationRecord

  belongs_to :contact, dependent: :destroy
  belongs_to :teacher_user
  has_one :service_order, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :service_type
  belongs_to_active_hash :unit_price

  with_options presence: true, numericality: {other_than: 1, message: "を選択してください"} do
    validates :service_type_id
    validates :unit_price_id
  end
  
  validates :number_of_times, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1,message: "は1以上の整数を入力してください"}

end