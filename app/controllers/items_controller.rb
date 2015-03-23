class ItemsController < ApplicationController


	before_filter :find_item,  only: [:show, :upvote, :edit, :update, :destroy]
  #фільтри.при повторені коду.приватність(admin)
	#before_filter :check_if_admin, only: [:show, :new, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:edit, :show, :new, :destroy]
 
   def index
	  	@items = Item.all
	  	#render text: @items.map { |i| "#{i.name} #{i.price} #{i.weight}"}.
	  	#join("<br/>")
    end

   #/items/1 GET
   def show #read
	   	if @item #= Item.where(id: params[:id]).first(before_filter) #зміна "@item" доступна в методі show(show.html.erb), якшо "item" то не доступна 
	    	render "items/show" #show.html.erb
	    else
	    	render_403
	    end
    end

   #/items Post
   def create
   	    #p params #Хеш.Щоб в браузері передавати значення зміних
   	    #@item = Item.create(name: params[:name], description: params[:description], real: params[:real],
   	 	  #weight: params[:weight])
   	    #render text: " #{@item.id}: #{@item.name} #{!@item.new_record?}"перевіряє чи є запис в БД
        @item = Item.create(item_params)
        if @item.errors.empty?
     	   redirect_to action: "index" 
     	  else
     	  render "new"
     	end
    end
 
    #/items/1/edit get
   def edit #обновлює і відправляє в update
   		#@item = Item.find(params[:id]) (before_filter)
   end
    
    #/items/new
   def new #створює і відправляє в create
   	    @item = Item.new
   end
   
   # /item/1 PUT->method
   def update
   		#@item = Item.find(params[:id]) (before_filter)
   		@item.update_attributes(item_params)
      if @item.errors.empty?
     	   redirect_to item_path(@item)
     	else
     	  render "edit"
     	end
   end

    # /items/1 DELETE->method
   def destroy
	   	#@item = Item.find(params[:id])(before_filter)
	   	@item.destroy
	   	redirect_to action: "index"
   end

   def upvote #likes
   		@item.increment!(:votes_count)
   		#збільшить voutes_count на 1 і save
   		redirect_to action: "index"
   end

   def expensive
   		@items = Item.where("price>500")
   		render "expensive"
   end

   private

   def find_item #(before_filter)
   		@item = Item.find(params[:id])
   		render_403 unless @item
   end

   def item_params
        params.require(:item).permit(:name, :price, :weight, :description)     
        #require->parametr, permit->objects of parametr 
   end


end
