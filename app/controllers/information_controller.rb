class InformationController < ApplicationController

  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # GET /information
  def index
    @information = Information.all
  end

  # GET /information/1
  def show
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

    if @information.save
      redirect_to @information, notice: 'Information was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /information/1
  def update
    if @information.update(information_params)
      redirect_to @information, notice: 'Information was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /information/1
  def destroy
    @information.destroy
    redirect_to information_index_url, notice: 'Information was successfully destroyed.'
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
