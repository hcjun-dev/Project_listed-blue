class CommentsController < ApplicationController
    
    def create 
        @item = Item.find(params[:item_id])
        @comment = @item.comments.create(params[:comment].permit(:name, :body))
        redirect_to item_path(@item)
    end
    
    def destroy
        @post = Item.find(params[:item_id])
        @comment = @item.comments.find(params[:id])
        @comment.destroy

        
        redirect_to item_path(@item)
    end
end
