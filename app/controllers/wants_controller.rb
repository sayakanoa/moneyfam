class WantsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def new
    @want = Want.new
    @month = Time.zone.today
  end

  def index
    @date = Date.current.strftime
    @buy = Buy.new
    @wants = current_user.wants.excepted_bought
  end

  def create
    @want = Want.new(want_params)
    @want.user_id = current_user.id
    if @want.save
      redirect_to wants_path, notice: "追加できました"
    else
      flash[:alert] = "追加できていません。"
      render :new
    end
  end

  def destroy
    @want = Want.find(params[:id])
    @want.destroy
    redirect_to wants_path
  end

  private

  def want_params
    params.require(:want).permit(:month, :name, :price, :priority, :limit_date)
  end

  def correct_user
    want = Want.find(params[:id])
    redirect_to wants_path(current_user) unless want.user == current_user
  end
end
