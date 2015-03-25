OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB'], ENV['GITHUB_SECRET']
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET']
end