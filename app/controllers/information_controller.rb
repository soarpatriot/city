class InformationController < ApplicationController

  before_action :set_information, only: [:show, :edit, :update, :destroy,:display]
  before_action :authenticate_user!, except: [:show]
  layout "users", except: [:show]
  # GET /information
  def index
    @information = current_user.information.page params[:page]
  end

  # GET /information/1
  def show

  end

  def display
       render "show"
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  def create
    @information = Information.new(information_params)

    if current_user.information  <<  @information
      redirect_to @information, notice: '信息创建成功'
    else
      render :new
    end
  end

  # PATCH/PUT /information/1
  def update
    if @information.update(information_params)
      redirect_to @information, notice: '信息更新成功'
    else
      render :edit
    end
  end

  # DELETE /information/1
  def destroy
    @information.destroy
    redirect_to information_index_url, notice: '信息删除成功'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def information_params
      params.require(:information).permit(:title, :description, :image)
    end
end
