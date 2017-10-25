class Item < ActiveRecord::Base
    @all_categories = ['Furniture','Book']
    def self.all_categories
        return @all_categories
    end
end
