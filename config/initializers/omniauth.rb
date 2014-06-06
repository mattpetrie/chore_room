Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['Github_ClientID'], ENV['Github_ClientSecret']
end
