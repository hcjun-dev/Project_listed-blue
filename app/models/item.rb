class Item < ActiveRecord::Base
    has_many :comments
    belongs_to :item
    
    mount_uploaders :attachments, AttachmentsUploader
    serialize :attachments, JSON
    
    validates_integrity_of :attachments
    attr_accessible :category, :title, :description, :price, :post_date, :contact, :user_name, :attachments, :attachments_cache
    
    @all_categories = ['Anamals', 'Appliances', 'Automotive', 'Baby/Kid', 'Beauty/Health', 'Bikes', 'Books', 'Camping', 'Clothes', 'Computers', 'Crafts', 'Electronics', 'Farm/Garden', 'Furniture', 'Gaming', 'General', 'Household', 'Jewelry', 'Music', 'Parts', 'Photo/Video', 'Sporting', 'Tools', 'Toys/Games']
    def self.all_categories
        return @all_categories
    end
end