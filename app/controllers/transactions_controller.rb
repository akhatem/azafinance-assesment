class TransactionsController < ApplicationController
  before_action :authorize_customer!
  
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      render json: {
        message: 'Transaction was created successfully.',
        data: @transaction,
        status: :ok
      }
    else
      render(
        json: {
          errors: {
            message: @transaction.errors.full_messages || 'Transaction not created!'
          }
        },
        status: :unprocessable_entity
      )
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :currency)
  end
end
