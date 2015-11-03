class MessagesController < ApplicationController

  def index
    if current_user
      @user = current_user
      if params[:message]
        @contact = @user.contacts.find_or_create_by(number: params[:message][:to])
      else
        @contact = @user.contacts.last
      end
      @messages = @user.messages.all
      @contacts = @user.contacts.all
    end

    respond_to do |format|
      format.html { }
      format.js
    end

  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html { redirect_to message_path(@message) }
      format.js
    end
  end

  def new
    @user = current_user
    @contact = @user.contacts.find_or_create_by(number: '9717128576')
    @message = Message.new
  end

  def create
    @user = current_user
    @contact = @user.contacts.find_or_create_by(number: params[:message][:to])

    if params[:message][:first_name] != "John"
      @contact.first_name = params[:message][:first_name]
      @contact.save
    end
    if params[:message][:last_name] != "Doe"
      @contact.last_name = params[:message][:last_name]
      @contact.save
    end
    @message = @user.messages.new(message_params)
    @message.contact = @contact

    if @message.save
      flash[:notice] = "your message has been sent"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body, :user_id, :contact_id)
  end

  def  contact_params
    params.require(:contact).permit(:number, :first_name, :last_name)
  end
end
