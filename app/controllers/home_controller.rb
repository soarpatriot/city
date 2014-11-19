class HomeController < ApplicationController
   def index
      @information = []
      @information = Information.recently

   end
   
   def about
   	 
   end
   def feedback

     FeedbackMailer.feed(current_user, params[:content]).deliver
     redirect_to about_path
   end
end
