
class UserController < ApplicationController

  def index
    @user_list = User.all
  end
  def show
  end
  def edit
  end
  def drop
  end
end
