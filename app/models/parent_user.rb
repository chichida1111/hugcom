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


  with_options presence: true do
    validates :email
    validates :encrypted_password
    validates :phone_number
    validates :last_name_p_j 
    validates :first_name_p_j
    validates :last_name_p_k
    validates :first_name_p_k
    validates :group_id
  end

end