json.array! @payment_transactions.each do |payment_transaction|
  json.id                        payment_transaction.id
  json.transaction_type          payment_transaction.transaction_type
  json.currency                  payment_transaction.currency
  json.transaction_identifier    payment_transaction.transaction_identifier
  json.dot                       payment_transaction.dot.strftime("%A %m %B %H:%M:%S")
  json.user_id                   payment_transaction.user_id
end