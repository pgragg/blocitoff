class UsersController < ApplicationController
  def new
   @user = User.new
  end

  def edit
   @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to after_sign_in_path(@user), :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items 
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_url, :notice => "Success in editing is yours!"
    else
      render "new"
    end
  end

  private 

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end