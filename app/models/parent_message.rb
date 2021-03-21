class ParentMessage < ApplicationRecord

  belongs_to :parent_user
  belongs_to :contact

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :attendance
  belongs_to_active_hash :body_temperature
  belongs_to_active_hash :pick_up_time
  belongs_to_active_hash :pick_up_person

  


end