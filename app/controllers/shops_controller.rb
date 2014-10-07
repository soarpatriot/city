class ShopsController < ApplicationController

   before_action :load_shop, only: [:edit, :show]
   layout  "users", except: [:show]

   def index

   end
   def show

   end
   def edit

   end

   def  load_shop
       @shop = Shop.find(params[:id])
   end
end
