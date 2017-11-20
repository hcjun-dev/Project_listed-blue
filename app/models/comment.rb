class Comment < ActiveRecord::Base
  belongs_to :item
  attr_accessible :name, :body, :item
end
