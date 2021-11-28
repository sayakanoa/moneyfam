class PaymentsController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    if @payment.save
      redirect_to payments_path(user_id: current_user.id), notice: "作成できました。"
    else
      flash[:alert] = "作成できていません。"
      render :new
    end
  end

  def index
    # データを入れる器を作る
    @lists = { id: [], month: [], house: [], life: [], food: [], enjoy: [], saving: [], investing: [], other: [],
               sum: [] }
    @user = User.find_by(id: params[:user_id])
    if params[:month]
      #params[:month]を文字列から日付型に変換する
      @month = Date.parse(params[:month])
    else
      @month = Time.zone.today
    end

    # 器に入れるデータ,１年ごとの表示,月順
    @payments = @user.payments.where(month: @month.all_year).order(:month)
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
    # 空箱にデータを直接入れる
    @graph_data = {
      家賃: @payment.house,
      生活費: @payment.life,
      食費: @payment.food,
      自由費: @payment.enjoy,
      貯金: @payment.saving,
      資産運用: @payment.investing,
      その他: @payment.other
    }

    @sum = @payment.house + @payment.life + @payment.food + @payment.enjoy + @payment.saving + @payment.investing + @payment.other
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to payments_path(user_id: current_user.id)
  end

  private

  def payment_params
    params.require(:payment).permit(:month, :house, :life, :food, :enjoy, :saving, :investing, :other)
  end

  def correct_user
    payment = Payment.find(params[:id])
    redirect_to payments_path(current_user) unless payment.user == current_user
  end

end
