class ItemsController < ApplicationController
  
  def item_params
    params.require(:item).permit(:category, :title, :description, :price, :post_date, :contact, :user_name, {attachments: []}, :attachments_cache)
  end

  def show
    id = params[:id] # retrieve item ID from URI route
    @item = Item.find(id) # look up item by unique ID
    # will render app/views/items/show.<extension> by default
    
    # This part is used in displaying the rating of the users
    @rating_percentage = nil
    @rating_out_of = nil
    if @user = User.find_by_uid(@item.user_id)
      if !(@user.rating.nil? && @user.total_rating.nil?)
        @rating_percentage = (@user.rating/@user.total_rating*100)
        @rating_out_of = (@user.total_rating/5)
      end
    end
  end

  def index
    @all_categories = Item.all_categories
    @sort_by = params[:sort_by] ? params[:sort_by] : (session[:sort_by] || "id")
    @hilite = params[:sort_by]
    @filtered_categories = (params[:categories] and params[:commit] == 'Refresh') ? params[:categories].keys : (session[:categories] || @all_categories)

    if params[:sort_by] != session[:sort_by] or params[:categories] != session[:categories]
      session[:categories] = @filtered_categories
      session[:sort_by] = @sort_by
      flash.keep
      redirect_to items_path :sort_by => @sort_by, :categories => @filtered_categories
    end
    @items = Item.order(@sort_by).where(category: @filtered_categories)
    delete_old_records  # Runs 90 day check to clean up database
  end
  
  # This allows only users that are signed in the ability to make listings
  before_filter :logged_in_user?, :only =>[:create, :new]
  def logged_in_user?
    if current_user
      # Do the conttroller action
    else
      flash[:notice] = "You must login to create items."
      redirect_to items_path
    end
  end
  
  # This allows only the user who created the listing to change it
  before_filter :correct_user?, :only =>[:edit, :update, :destroy]
  def correct_user?
    @item = Item.find(params[:id])
    if current_user && @item.user_id == current_user.uid.to_s
      # Do the conttroller action
    else
      flash[:notice] = "You cannot perform this action."
      redirect_to item_path
    end
  end
  
  def new
    # default: render 'new' template
  end

  def create
    @item = Item.new(item_params)
    @item.post_date = Time.now
    @item.user_id = current_user.uid.to_s
    @item.user_name = current_user.name
    @item.contact = current_user.email
    if @item.save
      flash[:notice] = "#{@item.title} was successfully created."
      redirect_to items_path
    else
      flash[:item_errors] = @item.errors.full_messages
      render :new
    end
    # upload_images(@item.attachments)
  end

  def edit
    # Find item done in before_filter
  end

  def update
    # Find item done in before_filter
    @item.update_attributes!(item_params)
    flash[:notice] = "#{@item.title} was successfully updated."
    redirect_to item_path(@item)
  end

  def destroy
    # Find item done in before_filter
    @item.destroy
    flash[:notice] = "Item '#{@item.title}' deleted."
    redirect_to items_path
  end
  
  private
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to items_path
    end
  end
  
  private
  # Deletes items after they hit a 90 mark
  def delete_old_records
    Item.where('created_at < ?', 90.days.ago).each do |item|
      item.destroy
    end
    # or Model.delete_all('created_at < ?', 90.days.ago) if you don't need callbacks
  end
  
  private
  def upload_images(images)
    images.each do |i|
      Cloudinary::Uploader.upload(i)
    end
  end
  
end
    
  
  

