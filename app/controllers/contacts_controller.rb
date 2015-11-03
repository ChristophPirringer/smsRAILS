class ContactsController < ApplicationController
  before_action :find_user
  def new
    @contact = @user.contacts.new
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def create
    @contact = @user.contacts.new(contact_params)
    if @contact.save
      flash[:notice] = "your contact has been saved"
      redirect_to root_path
    else
      render 'contact'
    end
  end

  private

  def  contact_params
    params.require(:contact).permit(:number, :first_name, :last_name)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
