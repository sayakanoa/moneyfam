class BuysController < ApplicationController

  def create
    buy = Buy.new(buy_params)
    buy.user_id = current_user.id
    if buy.save
      redirect_to buys_path, notice: "追加できました"
    else
     flash[:alert] = "追加できていません。"
     redirect_to wants_path
    end
  end

  def index
    @month = Time.zone.today
    @buys = current_user.buys.where(month: @month.all_month)
    if current_user.payments.exists?(month: @month.all_month)
      @month_enjoy = current_user.payments.find_by(month: @month.all_month).enjoy
    else
      @month_enjoy = "未登録です。"
    end
    @sum = Want.where(id: @buys.pluck('want_id')).sum('price')
  end

  private

  def buy_params
    params.require(:buy).permit(:want_id, :month)
  end
end
