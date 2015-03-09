class BlogPost < ActiveRecord::Base

	 has_many :coments, as: :commentable
	 
end
