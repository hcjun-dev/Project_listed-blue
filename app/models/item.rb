class Item < ActiveRecord::Base
    has_many :comments
    mount_uploaders :attachment, AttachmentUploader
    serialize :attachment, JSON
    
    validates_integrity_of :attachment
    attr_accessor :attachment, :attachment_cache
    
    @all_categories = ['Appliances', 'Automotive', 'Baby/Kid', 'Beauty/Health', 'Bikes', 'Books', 'Camping', 'Clothes', 'Computers', 'Crafts', 'Electronics', 'Farm/Garden', 'Furniture', 'Gaming', 'General', 'Household', 'Jewelry', 'Music', 'Parts', 'Photo/Video', 'Sporting', 'Tools', 'Toys/Games']
    def self.all_categories
        return @all_categories
    end
end