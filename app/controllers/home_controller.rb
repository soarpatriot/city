class HomeController < ApplicationController
   def index
      @information = Information.all
   end

   def shops
      @shops = Shop.all
   end
end
