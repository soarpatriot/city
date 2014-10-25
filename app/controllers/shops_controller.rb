class ShopsController < ApplicationController

   before_action :load_shop, only: [:show, :information]

   def index
        @shops = Shop.page params[:page]
   end

   def show
       @information = @shop.information.page params[:page]
   end

   def load_shop
       @shop = nil
       @shop = Shop.where(url:params[:id]).first  unless params[:id].nil?
       if @shop.nil?
         @shop = Shop.find(params[:id])
       end

   end

   def information
       @information = Information.find(params[:information_id])
   end
end
