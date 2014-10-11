class ShopsController < ApplicationController


   def index
        @shops = Shop.page params[:page]
   end

end
