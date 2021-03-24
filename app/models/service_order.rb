class ServiceOrder < ApplicationRecord

  belongs_to :service, dependent: :destroy
end