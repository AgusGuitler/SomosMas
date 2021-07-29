# frozen_string_literal: true

class Authentication
  def initialize(user)
    @email = user[:email]
    @password = user[:password]
    @user = User.find_by(email: @email)
  end

  def authentication
    @user && @user.authenticate(@password)
  end

  def generate_token
    JsonWebToken.encode({ user_id: @user.id, email: @user.email })
  end
end
