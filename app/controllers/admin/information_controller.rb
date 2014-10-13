class Admin::InformationController < Admin::AdminController

  def index
    @information = Information.page params[:page]
  end
end
