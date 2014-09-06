# OmniauthMyobOauth2

Strategy to authenticate with MYOB via ADFS OAuth2 in OmniAuth.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-myob-adfs-oauth2'

And then execute:

    $ bundle install

## Usage

Here's an example for adding the middleware to a Rails app in config/initializers/omniauth.rb:
```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :myob_adfs_oauth2, your_client_id, your_client_secret
end
```

## Configuration

You can configure several options, which you pass in to the provider method via a hash:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :myob_oauth2, your_client_id, your_client_secret,
  { 
      client_options: { site: 'https://test.secure.myob.com' }, #set the target site to SIT
      scope: 'mydot.assets' #set the scope you want
  }
end
```


## Auth Hash
Here's an example of an authentication hash available in the callback by accessing request.env["omniauth.auth"]:
```ruby
{
  "provider"=>"myob_oauth2", 
  "uid"=>"ab359535-7be6-49a2-b9fd-xxxxxxx", 
  "info"=>{
    "email"=>"test@my.com", 
    "name"=>"test@my.com"
  }, 
  "credentials"=>{
    "token"=>"a token", 
    "refresh_token"=>"a refresh token, 
    "expires_at"=>1406161910, 
    "expires"=>true
  }, 
  "extra"=>{
    "raw_info"=>{
      "uid"=>"ab359535-7be6-49a2-b9fd-db65af2e22e7", 
      "username"=>"vidya@my.com"}
    }
  }
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
