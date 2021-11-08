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
    @payments = current_user.payments.all
  end

  def show
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
