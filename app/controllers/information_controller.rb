class InformationController < ApplicationController

  before_action :set_information, only: [:show]



  def index
    @category = Category.find(params[:category_id])
    @information = Information.where(publish:true,category: @category).page params[:page]
  end
  def show
    @category = Category.find(params[:category_id]) unless params[:category_id].nil?
    @information.increment_visit_count
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_information
    @information = Information.find(params[:id])
  end


end
