module ApplicationHelper

	def urls_to_images(s) #string
		
		s.gsub! /\s(http:\/\/.*?\.(png|jpg))\s/ ,
				'<p><img src="\1" width="100"/></p>'

				s.html_safe
	end

	def urls_to_links(s)

		s.gsub! /\s(http:\/\/.*?)\s/ ,
			'<a href="\1">\1</a>'

			s.html_safe
	end

end
