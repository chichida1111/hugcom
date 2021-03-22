class TeacherUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :teacher_messages
  has_many :services

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :group
       
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name_t_j
    validates :first_name_t_j
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角（カタカナ）を使用してください' } do
    validates :last_name_t_k
    validates :first_name_t_k
  end

  with_options presence: true do
    validates :email
    validates :encrypted_password
    validates :group_id, numericality: {other_than: 1, message: "を選択してください"}
  end

end