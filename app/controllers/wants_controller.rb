class WantsController < ApplicationController

  def new
    @want = Want.new
  end

  def index
    @wants = current_user.wants.all
  end

  def create
    @want = Want.new(want_params)
    @want.user_id = current_user.id
    @want.save
    redirect_to wants_path
  end

  def show
    @want = Want.find(params[:id])
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
end
