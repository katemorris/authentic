class WelcomeController < ApplicationController
  def index

  end

  def show

  end

  def authorize
    require "pry"; binding.pry
    auth_code = params[:code]
    client_id = '3a401066b81df2c80d29'
    secret = '6e46ea7bd5de4af6bca0457235f3d7529858e1e9'
    post "https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{secret}&code=#{auth_code}&redirect_uri=/repos"
    require "pry"; binding.pry
  end
end
