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
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
