class TeacherUsers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_t_j, :first_name_t_j, :last_name_t_k, :first_name_t_k, :group_id ])
  end
  
end