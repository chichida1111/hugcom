class ParentUsers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :phone_number, :last_name_p_j, :first_name_p_j, :last_name_p_k, :first_name_p_k, :group_id ])
  end
  
end