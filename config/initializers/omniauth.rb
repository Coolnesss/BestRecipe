Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB'], ENV['GITHUB_SECRET']
end
