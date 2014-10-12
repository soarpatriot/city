class HomeController < ApplicationController
   def index
      @information = Information.where(publish:true).page params[:page]
   end

   def shops
      @shops = Shop.all
   end
end
