class TeacherUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         with_options presence: true do
          validates :email
          validates :encrypted_password
          validates :last_name_t_j
          validates :first_name_t_j
          validates :last_name_t_k
          validates :first_name_t_k
          validates :class_id
        end
end