class I::ShopsController < I::BaseController

  before_action :load_shop, except: [:index]

  def show
      @information = @shop.information.page params[:page]
  end

  def edit

  end

  def update
    if @shop.update(shop_params)
          redirect_to [:i,@shop], notice: '信息更新成功'
    else
          render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to information_index_url, notice: '信息删除成功'
  end

  def  load_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:id, :title, :description, :image, :contact, :address, :phone)
  end

  def new_info
      @information = Information.new
  end
  def edit_info

  end
  def update_info

  end
  def destroy_info

  end

  # POST /information
  def create_info
    @information = Information.new(information_params)

    if current_user.information  <<  @information
      redirect_to [:i,@information], notice: '信息创建成功'
    else
      render :new
    end
  end

  # PATCH/PUT /information/1
  def update
    if @information.update(information_params)
      redirect_to [:i,@information], notice: '信息更新成功'
    else
      render :edit
    end
  end

  # DELETE /information/1
  def destroy
    @information.destroy
    redirect_to i_information_index_path, notice: '信息删除成功'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_information
    @information = Information.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def information_params
    params.require(:information).permit(:id, :title, :description, :publish,:image, :price, :contact, :mobile_number, :qq, :weixin)
  end

end
