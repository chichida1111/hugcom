class ParentMessagesController < ApplicationController

  def create
       @parent_message = ParentMessage.new(parent_message_params)
       if @parent_message.save
        redirect_to "/contacts/#{@parent_message.contact.id}"
       else
        redirect_to root_path
       end
  end

  private
  
  def parent_message_params
    params.require(:parent_message).permit(:attendance_id, :body_temperature_id, :pick_up_time_id, :pick_up_person_id, :parent_comment ).merge(parent_user_id: current_parent_user.id, contact_id: params[:contact_id] )
  end

end