class PartnersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  def index
    @search = Partner.ransack(params[:q])
    @partners = @search.result
  end

  def show
    @partner = Partner.eager_load(:product_infos, :case_studies).find(params[:id])
  end

  def new
    @partner = Partner.new
    @partner.product_infos.build
    @partner.case_studies.build
  end

  def create
    @partner = current_user.partners.build(partner_params)
    if params[:back]
      render :new
    elsif @partner.save
      redirect_to partners_path, notice: "会社情報を作成しました！"
    else
      render :new
    end
  end

  def edit
    unless current_user == @partner.user || current_user.admin?
      redirect_to partners_path, alert: '不正なアクセスです'
    end
  end

  def update
    if current_user == @partner.user || current_user.admin?
      if @partner.update(partner_params)
        redirect_to partners_path, notice: "会社情報を編集しました！"
      else
        render :edit
      end
    else
      redirect_to partners_path, alert: '不正なアクセスです'
    end
  end

  def destroy
    if current_user == @partner.user || current_user.admin?
      @partner.destroy
      redirect_to partners_path, notice:"会社情報を削除しました！"
    else
      redirect_to partners_path, alert: '不正なアクセスです'
    end
  end

  def confirm
    @partner = current_user.partners.build(partner_params)
    @costs = Cost.all
    @service_contents = ServiceContent.all
    @ai_categories = AiCategory.all
    render :new if @partner.invalid?
  end

  private

  def partner_params
    params.require(:partner).permit(:name,
      :address,
      :url,
      :established,
      :service,
      :provision,
      :engineer,
      :product,
      :case, {cost_ids: []},
      {service_content_ids: []},
      {ai_category_ids: []},
      product_infos_attributes: [:id, :name, :content, :_destroy, :image, :image_cache],
      case_studies_attributes: [:id, :name, :content, :_destroy, :image, :image_cache])
  end

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def set_current_user
    @current_user = current_user
  end
end




