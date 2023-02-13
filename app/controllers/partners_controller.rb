class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_current_user

  def index
    @partners = Partner.all
    @partners = @partners.joins(:costs).where(costs: { id: params[:cost_id] }) if params[:cost_id].present?
    # @partners = rails_admin.partners
    # binding.pry
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  def create
    # @partner = Partner.new(partner_params)
    # @partner.user_id = current_user.id
    # Partner.create(partner_params)
    # @partner = Partner.new(partner_params)
    # @partner.user_id = current_user.id
    @partner = current_user.partners.build(partner_params)
    render :new if @partner.invalid?
    if params[:back]
      render :new
    else
      if @partner.save
        redirect_to partners_path, notice: "会社情報を作成しました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @partner.update(partner_params)
      redirect_to partners_path, notice: "会社情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @partner.destroy
    redirect_to partners_path, notice:"会社情報を削除しました！"
  end


  def confirm
    @partner = @current_user.partners.build(partner_params)
    render :new if @partner.invalid?
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :address, :url, :established, { cost_ids: [] })
  end

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def set_current_user
    @current_user = current_user
  end
end

