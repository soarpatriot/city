class InformationController < ApplicationController

  before_action :set_information, only: [:show]


  def index
    @information = Information.where(publish:true).page params[:page]
  end
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_information
    @information = Information.find(params[:id])
  end
end
