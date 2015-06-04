Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "JD58wZQDJEHadNamWSjCLCMYM", "SsaR1bq3wruIATUWPl1dxPB8gotiFq35TaPKJsL2gTR82qYZsM"
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :facebook, "640675139367293", "5b33dc7b5280942c0fe4facccea1b52a"
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
end
