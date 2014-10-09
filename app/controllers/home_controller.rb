class HomeController < ApplicationController
   def index
      @information = Information.page params[:page]
   end

   def shops
      @shops = Shop.all
   end
end
