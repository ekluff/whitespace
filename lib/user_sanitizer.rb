class UserParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:login, :password, :remember_me)
  end

  def sign_up
    default_params.permit(:username, :email, :password, :password_confirmation)
  end
end
