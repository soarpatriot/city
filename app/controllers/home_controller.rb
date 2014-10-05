class HomeController < ApplicationController
   def index
      @information = Information.all
   end
end
