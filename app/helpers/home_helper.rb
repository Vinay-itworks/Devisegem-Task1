module HomeHelper
  def signup_link
    link_to "Sign Up", new_user_registration_path
  end

  def signin_link
    link_to "Sign In", new_user_session_path
  end

  def edituser_link
    link_to "Edit Profile", edit_user_registration_path
  end

  def signout_link
    link_to "Sign Out", destroy_user_session_path, data: { turbo_method: :delete }
  end
end
