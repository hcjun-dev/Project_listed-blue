class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:rating)
  end
  
  def rating
    if current_user
      if not current_user.uid.to_s == session[:user]    # Prevents user rating themselves
        # Adds the rating to the user
        if @user = User.find_by_uid(session[:user])
          if @user.total_rating.nil? && @user.rating.nil?
            @user.rating = BigDecimal.new(user_params[:rating])
            @user.total_rating = 5
          else
            @user.rating += BigDecimal.new(user_params[:rating])
            @user.total_rating += 5
          end
          @user.save!
          session.delete(:user)    # Cleans up Session
          redirect_to item_path(session[:item_id]) and return
        else
          flash[:notice] = "No user exists"
        end
      else
        flash[:notice] = "You cannot review yourself."
      end
    else
      flash[:notice] = "You must login."
    end
    flash.keep
    redirect_to users_rate_path(session[:user])
  end
  
end
