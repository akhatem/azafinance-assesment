class Api::V1::PaymentTransactionsController < ApplicationController
  before_action :authenticate_user!, :authorize_customer!
  
  def index
    @payment_transactions = PaymentTransaction.all
    render json: @payment_transactions, status: 200
  end

  def show
    @payment_transaction = PaymentTransaction.find(params[:id])
    render json: {
      id: @payment_transaction.id,
      transaction_type: @payment_transaction.transaction_type,
      currency: @payment_transaction.currency,
      transaction_identifier: @payment_transaction.transaction_identifier,
      date_of_transaction: @payment_transaction.dot,
      user_id: @payment_transaction.user_id,
      transaction_value: @payment_transaction.transaction_value,
    }, status: 200
    
  end

  def create
    @payment_transaction = current_user.payment_transactions.new(payment_transaction_params)
    if @payment_transaction.save
      render json: {
        message: 'Transaction was created successfully.',
        data: @payment_transaction,
        status: :ok
      }
    else
      render(
        json: {
          errors: {
            message: @payment_transaction.errors.full_messages || 'Transaction not created!'
          }
        },
        status: :unprocessable_entity
      )
    end
  end

  private

  def payment_transaction_params
    params.require(:payment_transaction).permit(:transaction_type, :currency)
  end
end
