Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['3a401066b81df2c80d29'], ENV['6e46ea7bd5de4af6bca0457235f3d7529858e1e9']
end
