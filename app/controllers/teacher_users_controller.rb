class TeacherUsersController < ApplicationController

  def show
  end

  def update
    if current_teacher_user.update(teacher_user_params)
      redirect_to root_path
    else
      redirect_to "show"
    end
  end

  private

  def teacher_user_params
    params.require(:teacher_user).permit(:email, :last_name_t_j, :first_name_t_j, :last_name_t_k, :first_name_t_k, :group_id ) 
  end

end
