class I::ShopsController < I::BaseController

  before_action :load_shop, except: [:index]

  def index
    @shops = current_user.shop.page params[:page]
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @shop.destroy
    redirect_to information_index_url, notice: '信息删除成功'
  end

  def  load_shop
    @shop = Shop.find(params[:id])
  end

end
