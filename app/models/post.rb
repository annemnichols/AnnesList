class Post < ActiveRecord::Base
	belongs_to :user

	# To set number of items on page in index (pagination)
	self.per_page = 10

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :large => "500x500>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
