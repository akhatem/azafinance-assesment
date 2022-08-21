# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  name                   :string           not null
#  fcm_token              :string
#  role                   :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :role, :fcm_token
  
  # json.token user.generate_jwt
end
