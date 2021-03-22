class ParentUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
                  
  has_one  :contact
  has_many :parent_messages
  has_one :card, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :group

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name_p_j
    validates :first_name_p_j
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角（カタカナ）を使用してください' } do 
    validates :last_name_p_k
    validates :first_name_p_k
  end

  with_options presence: true do
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "は半角数字で10〜11桁で入力してください"}
    validates :group_id, numericality: {other_than: 1, message: "を選択してください"}
  end

end