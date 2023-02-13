class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  def index
    @partners = Partner.all
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
    @partner = Partner.new(partner_params)
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
    @partner = Partner.new(partner_params)
    render :new if @partner.invalid?
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :address, :url, :established)
  end

  def set_partner
    @partner = Partner.find(params[:id])
  end
end

