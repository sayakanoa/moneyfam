class WantsController < ApplicationController

  def index
    @wants = current_user.wants.all
    @want = Want.new
  end

  def create

  end

  def destroy
  end

end
