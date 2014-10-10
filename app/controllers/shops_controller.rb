class ShopsController < ApplicationController

   before_action :load_shop, only: [:edit, :show]
   before_action :authenticate_user!, except: [:show]
   layout "users", except: [:show]

   def index
        @shops = Shop.all
   end
   def show

   end
   def edit

   end

   def  load_shop
       @shop = Shop.find(params[:id])
   end
end
