class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_current_user

  def index
    # binding.pry
    @partners = Partner.all
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = current_user.partners.build(partner_params)
    render :new if @partner.invalid?
    # binding.pry
    if
      params[:back]
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
    @costs = Cost.all
    # @cost_ids = params[:partner][:cost_id]
    render :new if @partner.invalid?
    # binding.pry
  end

  private
  def partner_params
    params.require(:partner).permit(:name, :address, :url, :established, cost_ids: [])
  end

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def set_current_user
    @current_user = current_user
  end
end

