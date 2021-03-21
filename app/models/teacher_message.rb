class TeacherMessage < ApplicationRecord

  belongs_to :teacher_user
  belongs_to :contact
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :physical_condition
  belongs_to_active_hash :school_lunch
  belongs_to_active_hash :defecation

end