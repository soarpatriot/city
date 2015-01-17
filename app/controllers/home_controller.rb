class HomeController < ApplicationController

   def index

      @information = []
      @information = Information.recently

   end
   
   def about
   	 
   end
   def download
     render layout: "logo" 
   end
   def feedback

     FeedbackMailer.feed(current_user, params[:content]).deliver

     redirect_to about_path, notice: '非常感谢您的宝贵意见。'
   end
end
