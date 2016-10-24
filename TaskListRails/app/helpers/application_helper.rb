module ApplicationHelper
  def login_status
    if session[:uid].nil?
      "Not logged in"
    else
      "Logged in as #{nickname}"
    end
  end
end
