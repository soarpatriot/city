class ShopsController < ApplicationController

   before_action :load_shop, only: [:edit]
   layout  "users"
   def edit

   end

   def  load_shop
       @shop = Shop.find(params[:id])
   end
end
