class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

  
   private
   
	   def authenticate_user!
      	   render_403 unless user_signed_in?
       end

	   def render_404
	   	 render "public/404"
	   end

	   def render_403
	   	 render "public/403"
	   end

	   #def check_if_admin #(before_filter)
    	 #render_403 unless params[:admin]
       #end

       def after_sign_in_path_for(resource)
  		  items_path
	    end
    
    	def after_sign_out_path_for(resource_or_scope)
  		  request.referrer
		end

end
