class Item < ActiveRecord::Base
    @all_categories = ['Appliances', 'Automotive', 'Baby/Kid', 'Beauty/Health', 'Bikes', 'Books', 'Camping', 'Clothes', 'Computers', 'Crafts', 'Electronics', 'Farm/Garden', 'Furniture', 'Gaming', 'General', 'Household', 'Jewelry', 'Music', 'Parts', 'Photo/Video', 'Sporting', 'Tools', 'Toys/Games']
    def self.all_categories
        return @all_categories
    end
end
