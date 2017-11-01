OmniAuth2.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth2::Builder do
  provider :google_oauth2, '276398849280-tldubmh2lrp3vcsj3oaofjvv5ga8ttg8.apps.googleusercontent.com', 'vhYzMBVBBk6EkJu1uPT-BEht', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end