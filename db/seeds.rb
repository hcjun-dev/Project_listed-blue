# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

items = [{:category => 'Furniture', :title => 'New Sofa', :description => 'I would like to sell my new sofa', :price => 100, :post_date => '18-10-2017'},
    	 {:category => 'Books', :title => 'IT484 TextBook SaaS', :description => 'This book was used in IT484 during Fall 2017', :price => 35, :post_date => '17-10-2017'},
  	     {:category => 'Books', :title => 'Sample', :description => 'A Free Sample', :price => 0.01, :post_date => '17-10-2017', :user_name => 'ElloH'},
  	     {:category => 'Electronics', :title => 'Iphone 6S 128 GB', :description => 'I recently upgraded to a new iPhone, and I am selling my Space Gray iPhone 6S with 128GB storage. This phone has been unlocked by ATT, and will work with T-Mobile as well. I will meet with the buyer at the ATT store or the T-Mobile store in Mankato to verify that the phone will activate on their account properly. The phone is in great shape, there are two very small scratches (1/8") on the screen, but do not affect the feel or use of the phone. The back and edges of the phone are in excellent condition as it has been in a wallet case since the first day I purchased it. This comes with the original Apple iPhone 6s box. I will only accept cash for payment.', :price => '419.79', :post_date => '20-11-2017', :contact => nil, :user_name => 'md abu bakar', :user_id => ''}
  	     ## {:category => '', :title => '', :description => '', :price => '', :post_date => '', :contact => nil, :user_name => '', :user_id => ''}
  	     ## new seed with blank(template)
  	    ]

items.each do |item|
  Item.create!(item)
end
