class I::ShopsController < I::BaseController

  before_action :load_shop, except: [:index]

  def show

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
end
