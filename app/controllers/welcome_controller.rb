class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def index

  end

  def show
    @public_repos = RepoFacade.get_repos('public', current_user)
    @private_repos = RepoFacade.get_repos('private', current_user)
  end

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to repos_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
  end
end
