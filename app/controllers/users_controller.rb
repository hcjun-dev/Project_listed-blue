class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:rating)
  end
  
  def rating
    @user = User.find_by_uid(session[:user])
    if @user.total_rating.nil? && @user.rating.nil?
      @user.rating = BigDecimal.new(user_params[:rating])
      @user.total_rating = 5
    else
      @user.rating += BigDecimal.new(user_params[:rating])
      @user.total_rating += 5
    end
    @user.save!
    redirect_to item_path(session[:item_id])
  end
  
end
