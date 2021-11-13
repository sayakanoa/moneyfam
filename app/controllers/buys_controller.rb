class BuysController < ApplicationController
    def create
      buy = Buy.new(buy_params)
      buy.user_id = current_user.id
      buy.save
      redirect_to buys_path
    end

    def index
      @buys = current_user.buys.all
      array = []
      @buys.all.each do |buy|
      array << buy.want.price
      end
      @sum = array.sum
    end

    private
    def buy_params
    params.require(:buy).permit(:want_id, :month)
    end
end
