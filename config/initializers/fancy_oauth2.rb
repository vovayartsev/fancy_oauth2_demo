FancyOauth2.configure do |config|
  config.client_id = "743309445894.apps.googleusercontent.com"
  config.client_secret = 'frH93lRxEPjKBJQ0WOjgtJNU'

  # These are Google-related
  # see http://code.google.com/apis/accounts/docs/OAuth2UserAgent.html
  config.site = 'https://accounts.google.com/'
  config.authorize_url = '/o/oauth2/auth'
  config.token_url = '/o/oauth2/token'

  # These is added to redirect_uri query string
  # see http://code.google.com/apis/accounts/docs/OAuth2WebServer.html
  config.default_options = {
    scope: "https://www.google.com/analytics/feeds/",
    redirect_uri: FancyOauth2.callback_url_builder,
    response_type: "code",
    access_type: 'offline',
    approval_prompt: "force"
  }
end
