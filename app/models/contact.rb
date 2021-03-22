class Contact < ApplicationRecord

  belongs_to :parent_user
  has_one_attached :image
  has_many :parent_messages, dependent: :destroy
  has_many :teacher_messages, dependent: :destroy
  has_one :service

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :group

  with_options presence: true do
    validates :image
    validates :group_id, numericality: {other_than: 1, message: "を選択してください"}
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name_c_j
    validates :first_name_c_j
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角（カタカナ）を使用してください' } do
    validates :last_name_c_k
    validates :first_name_c_k
  end

end
