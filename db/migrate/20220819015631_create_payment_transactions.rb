class CreatePaymentTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_transactions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :transaction_type
      t.integer :currency
      t.datetime :dot
      t.string :transaction_identifier
      t.decimal :transaction_value

      t.timestamps
    end
  end
end
