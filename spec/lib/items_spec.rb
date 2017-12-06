require "spec_helper"
require "./app/controllers/items_controller.rb"
require "./app/controllers/application_controller.rb"

describe ItemsController do
    it "has a title" do
        expect(@item.title).not_to be_empty
    end
    
    it "has a description" do
        expect(@item.description).to be_a(String)
    end
    
    it "has an ID" do
        user_id = @item.find(params[:id])
        expect(user_id).to be_a(String)
    end
    
    it "has a post date" do
        post_date = Time.now
        expect(post_date).to be_a(Date)
    end
    
    it "is in a category" do
        item_category = @item.category
        expect(item_category).not_to be_empty
    end
    
    it "has a user ID" do
        user_ID = @item.user_name
        expect(User_ID).not_to be_empty
    end
    
    
end