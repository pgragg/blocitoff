class ItemsController < ApplicationController

  def new 
    @user = current_user
    @item = Item.new 
  end 
  def create
    @user = current_user 
    @item = @user.items.create(item_params)
    @item.save! 
    redirect_to user_path(@user) 
  end

  def destroy  
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html
      format.js   #{ render :layout => false }
    end
  end 

  private 

  def item_params
    params.require(:item).permit(:name)
  end 
end
