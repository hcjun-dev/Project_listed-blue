class ItemsController < ApplicationController
  
  def item_params
    params.require(:item).permit(:category, :title, :description, :price, :post_date, :contact, :user)
  end

  def show
    id = params[:id] # retrieve item ID from URI route
    @item = Item.find(id) # look up item by unique ID
    # will render app/views/items/show.<extension> by default
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
  end
  
  # This allows only users that are signed in the ability to make listings
  before_filter :is_user?, :only =>[:create, :new]
  def is_user?
    if current_user
      # Do the conttroller action
    else
      flash[:notice] = "You must login to create items."
      redirect_to items_path
    end
  end
  
  # This allows only the user who created the listing to change it
  before_filter :can_user?, :only =>[:edit, :update, :destroy]
  def can_user?
    @item = Item.find(params[:id])
    if current_user && @item.user_id == :user_id.to_s
      # Do the conttroller action
    else
      flash[:notice] = "You can't edit/delete this item."
      redirect_to item_path
    end
  end
  
  def new
    # default: render 'new' template
  end

  def create
    @item = Item.new(item_params)
    @item.post_date = Time.now
    @item.user_id = :user_id.to_s
    @item.user = current_user.name
    @item.contact = current_user.email
    @item.save!
    flash[:notice] = "#{@item.title} was successfully created."
    redirect_to items_path
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
  
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to items_path
    end
  end
  
end
