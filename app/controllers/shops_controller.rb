class ShopsController < ApplicationController

   before_action :load_shop, only: [:show, :information]

   def index
        @shops = Shop.page params[:page]
   end

   def show
       @information = @shop.information.page params[:page]
   end

   def load_shop
       @shop = Shop.find(params[:id])
   end

   def information
       @information = Information.find(params[:information_id])
   end
end
