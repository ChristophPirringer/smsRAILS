class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]
  def show
    @message = @user.messages.new
  end
end

  def new

  end

  def create

  end

private

def find_user
  @user = current_user
end
