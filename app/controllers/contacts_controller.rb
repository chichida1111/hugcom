class ContactsController < ApplicationController
before_action :authenticate_parent_user!, except: [:show, :index ]
before_action :set_contact, only: [:show, :edit, :update, :destroy ]
before_action :parent_user_of_contact?, only: [:edit, :update, :destroy ]

  def destroy
    @contact.destroy
  end

  def index
    if parent_user_signed_in?
     @contact = Contact.all.where(parent_user_id: current_parent_user.id)
     @contacts = Contact.all.where(group_id: current_parent_user.group_id).where.not(parent_user_id: current_parent_user.id)
    elsif teacher_user_signed_in?
     @contacts = Contact.all.where(group_id: current_teacher_user.group_id)
    end
  end
  
  def edit
  end

  def update
     if @contact.update(contact_params)
      redirect_to contact_path(@contact.id), method: :get
     else
      render :edit
     end
  end

  def show
    @parent_message = ParentMessage.new
    @parent_messages = @contact.parent_messages.order(created_at: :desc).limit(5)
    @teacher_message = TeacherMessage.new
    @teacher_messages = @contact.teacher_messages.order(created_at: :desc).limit(5)
    @services = Service.all.where(contact_id: @contact.id)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render new_contact_path
    end
  end


private
def contact_params
  params.require(:contact).permit(:image, :group_id, :last_name_c_j, :first_name_c_j, :last_name_c_k, :first_name_c_k ).merge(parent_user_id: current_parent_user.id)
end

def set_contact
  @contact = Contact.find(params[:id])
end

def parent_user_of_contact?
  unless @contact.parent_user_id == current_parent_user.id
   redirect_to root_path
  end
end

end

