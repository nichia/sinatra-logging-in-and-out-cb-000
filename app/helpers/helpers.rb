class Helpers
  def self.current_user(session)
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    # check if session[:user_id] == nil, user is not logged in
    if session[:user_id] == nil
      false
    else
      true
    end
  end
end
