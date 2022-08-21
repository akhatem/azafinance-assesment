json.call(user, :id, :email, :name, :role, :hamada)
json.token user.generate_jwt


def hamada
  {
    strange: "hamada"
  }
end
