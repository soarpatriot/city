class ShopsController < ApplicationController

   before_action :load_shop, only: [:show]

   def index
        @shops = Shop.page params[:page]
   end

   def show
       @information = @shop.information.page params[:page]
   end

   def load_shop
       @shop = Shop.find(params[:id])
   end
end
