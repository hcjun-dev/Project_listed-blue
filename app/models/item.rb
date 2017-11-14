require 'carrierwave/orm/activerecord'
class Item < ActiveRecord::Base
    mount_uploaders :attachment, AttachmentUploader
    serialize :attachment, JSON
    attr_accessor :attachment_cache
    
    @all_categories = ['Appliances', 'Automotive', 'Baby/Kid', 'Beauty/Health', 'Bikes', 'Books', 'Camping', 'Clothes', 'Computers', 'Crafts', 'Electronics', 'Farm/Garden', 'Furniture', 'Gaming', 'General', 'Household', 'Jewelry', 'Music', 'Parts', 'Photo/Video', 'Sporting', 'Tools', 'Toys/Games']
    def self.all_categories
        return @all_categories
    end
end