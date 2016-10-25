module ApplicationHelper
  def user_name
    begin
      user = User.find(session[:user_id])
      if user.nickname
        return user.nickname
      elsif user.email
        return user.email
      else
        return "#{user.provider} user #{user.uid}"
      end
    rescue ActiveRecord::RecordNotFound
      return "ERROR: user not in database"
    end
  end
end
