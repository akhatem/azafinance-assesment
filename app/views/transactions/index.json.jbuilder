json.array! @transactions.each do |transaction|
  json.id                        transaction.id
  json.transaction_type          transaction.transaction_type
  json.currency                  transaction.currency
  json.transaction_identifier    transaction.transaction_identifier
  json.dot                       transaction.dot.strftime("%A %m %B %H:%M:%S")
  json.user_id                   transaction.user_id
  
end