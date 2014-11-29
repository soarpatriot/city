class InformationController < ApplicationController

  before_action :set_information, only: [:show,:like]



  def index
    @category = Category.find(params[:category_id])
    @information = Information.where(publish:true,category: @category).page params[:page]
  end
  def show
    @category = Category.find(params[:category_id]) unless params[:category_id].nil?
    @information.increment_visit_count
  end

  def like

    #current_user.likes @information unless current_user.nil?

    @has_voted = current_user.voted_for? @information
    @has_voted ? @information.unliked_by(current_user) : @information.liked_by(current_user)
    @has_voted ? @has_voted = false : @has_voted = true
    @likes = @information.get_likes.size

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_information

    @information = Information.find(params[:id])
  end


end
