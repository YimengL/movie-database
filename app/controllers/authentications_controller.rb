class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by(provider: auth['provider'],
                                                          uid: auth['uid'])
    if authentication
      log_in authentication.user
      redirect_to user_url(authentication.user)
    elsif current_user
      current_user.authentications.create(provider: auth['provider'],
                                          uid: auth['uid'])
      flash[:success] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.authentications.build(provider: auth['provider'], uid: auth['uid'])
      if user.valid?
        flash[:success] = "Sign in successfully."
        user.save
      else
        session[:omniauth] = auth.except('extra')
        redirect_to new_user_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:success] = "Successfully destroyed the authentication."
    redirect_to authentications_url
  end
end
