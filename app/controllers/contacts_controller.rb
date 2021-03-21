class ContactsController < ApplicationController
before_action :authenticate_parent_user!, except: [:show, :index ]

  def destroy
    contact =Contact.find(params[:id])
    contact.destroy
    redirect_to root_path
  end

  def index
    @contacts = Contact.all
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      redirect_to contact_path(contact.id), method: :get
    else
      render edit
    end
  end

  def show
    @contact = Contact.find(params[:id])
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

end

