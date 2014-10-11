class InformationController < ApplicationController

  def index
    @information = Information.page params[:page]
  end

end
