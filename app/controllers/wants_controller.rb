class WantsController < ApplicationController

  def index
    @wants = current_user.wants.all
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
    @want.user_id = current_user.id
    @want.save
    redirect_to wants_path
  end

  def destroy
    @want = Want.find(params[:id])
    @want.destroy
    redirect_to wants_path
  end

  private
  def want_params
    params.require(:want).permit(:month, :name, :price, :have_state, :buy_state, :limit_date)
  end
end
