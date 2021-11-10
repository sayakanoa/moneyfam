class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.save
    redirect_to payments_path
  end

  def index
    #データを入れる器を作る
    @lists = {id: [], month: [], house: [], life: [], food: [], enjoy: [], saving: [], investing: [], other: [], sum: []}
    #器に入れるデータ
    @payments = current_user.payments.all
    @payments.each do |pt|
      @lists[:id]    << pt.id
      @lists[:month] << pt.month
      @lists[:house] << pt.house
      @lists[:life]  << pt.life
      @lists[:food]  << pt.food
      @lists[:enjoy] << pt.enjoy
      @lists[:saving] << pt.saving
      @lists[:investing] << pt.investing
      @lists[:other] << pt.other
      @lists[:sum]   << pt.house + pt.life + pt.food + pt.enjoy + pt.saving + pt.investing + pt.other
    end
  end

  def show
    @payment = Payment.find(params[:id])
    @graph_data = {
      家賃: @payment.house,
      生活費: @payment.life,
      食費: @payment.food,
      交際費: @payment.enjoy,
      貯金: @payment.saving,
      資産運用: @payment.investing,
      その他: @payment.other
    }

  end


  def edit
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to payments_path
  end

  private
  def payment_params
    params.require(:payment).permit(:month, :house, :life, :food, :enjoy, :saving, :investing, :other)
  end

end
