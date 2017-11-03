OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :google_oauth2, '266365203182-rvrb932d7sd7rajf2robkepn02l5lg53.apps.googleusercontent.com', '4AW7NysBgNMYI-GPVU4Vlh8T', {
    client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},
    :provider_ignores_state => true,
    :scope => 'userinfo.email, userinfo.profile, plus.me',
    callback_path: '/auth/google_oauth2/callback'
  }
end
