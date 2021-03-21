class TeacherUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :teacher_messages
         has_many :services

         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :group
       
       
         with_options presence: true do
           validates :email
           validates :encrypted_password
           validates :last_name_t_j
           validates :first_name_t_j
           validates :last_name_t_k
           validates :first_name_t_k
           validates :group_id
         end

end