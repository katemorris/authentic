class WelcomeController < ApplicationController
  def index

  end

  def show
    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{current_user.token}"
        }
    )

    response = conn.get("/users/#{current_user.username}/repos")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def create
    code = params[:code]
    client_id = '3a401066b81df2c80d29'
    client_secret = '6e46ea7bd5de4af6bca0457235f3d7529858e1e9'

    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})

    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: {
        'Authorization': "token #{access_token}"
        }
    )

    response = conn.get('/user')
    data = JSON.parse(response.body, symbolize_names: true)

    user = User.find_or_create_by(uid: data[:id])
    user.username = data[:login]
    user.uid = data[:id]
    user.token = access_token
    user.save
    session[:user_id] = user.id
    redirect_to repos_path
  end
end
