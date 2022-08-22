# == Schema Information
#
# Table name: payment_transactions
#
#  id                     :bigint           not null, primary key
#  user_id                :bigint           not null
#  transaction_type       :integer
#  currency               :integer
#  dot                    :datetime
#  transaction_identifier :string
#  transaction_value      :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class PaymentTransaction < ApplicationRecord
  belongs_to :user

  enum currency: %i[egp usd eur gbp cad try aed kes]
  enum transaction_type: %i[input output]

  validates :currency, presence: true
  validates :transaction_type, presence: true
  validates :transaction_value, numericality: { greater_than: 0 }, presence: true
  validates_uniqueness_of :transaction_identifier

  before_create :set_transaction_identifier, :set_date_of_transaction

  private

  def set_transaction_identifier
    self.write_attribute(:transaction_identifier, generate_transaction_identifier)
  end

  def generate_transaction_identifier
    charset = Array('A'..'Z') + Array('a'..'z') + Array(0..9)
    code = Array.new(8) { charset.sample }.uniq.join
    if code.length < 8
      generate_transaction_identifier
    else
      code
    end
  end

  def set_date_of_transaction
    self.write_attribute(:dot, Time.zone.now)
  end
end
