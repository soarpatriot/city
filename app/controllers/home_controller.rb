class HomeController < ApplicationController
   def index
      @information = []
      @information = Category.recently_one
      #categories = Category.all
      #categories.each  do |category|
          #infos = category.recently
          #@information  += infos
      #end
   end

   def shops
      @shops = Shop.all
   end
end
