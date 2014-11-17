class HomeController < ApplicationController
   def index
      @information = []
      @information = Information.recently

   end
end
