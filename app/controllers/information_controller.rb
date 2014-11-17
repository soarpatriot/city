class InformationController < ApplicationController

  before_action :set_information, only: [:show]


  def index
    @category = Category.find(params[:category_id])
    @information = Information.where(publish:true,category: @category).page params[:page]
  end
  def show

  end

  def category
     @category = Category.find("")
     @information = Information.where(publish:true).page params[:page]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_information
    @information = Information.find(params[:id])
  end
end
