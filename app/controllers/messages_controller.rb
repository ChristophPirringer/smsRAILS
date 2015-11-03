class MessagesController < ApplicationController

  def index
    @user = current_user
    @contact = @user.contacts.new
    @messages = Message.all

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
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "your message has been sent"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
