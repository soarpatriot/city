class HomeController < ApplicationController
   def index
      @information = []
      Category.all.each  do |category|

          information = Information.includes(:owner).where(publish:true, category: category ).limit(4)
          @information = @information + information
      end


   end

   def shops
      @shops = Shop.all
   end
end
