class TeacherMessagesController < ApplicationController

  def create
       @teacher_message = TeacherMessage.new(teacher_message_params)
       if @teacher_message.save
       redirect_to "/contacts/#{@teacher_message.contact.id}"
       else
       redirect_to root_path
       end
  end

  private
  
  def teacher_message_params
    params.require(:teacher_message).permit(:physical_condition_id, :school_lunch_id, :defecation_id, :teacher_comment, :image ).merge(teacher_user_id: current_teacher_user.id, contact_id: params[:contact_id] )
  end

end