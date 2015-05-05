require 'bundler/setup'

require 'pakyow'

require 'sass/plugin/rack'
Sass::Plugin.options[:template_location] = './app/assets/sass'
Sass::Plugin.options[:css_location] = './public/css'

Pakyow::App.define do
  configure :global do
    # put global config here and they'll be available across environments
    app.name = 'Pakyow'
  end

  configure :development do
    # put development config here
  end

  configure :prototype do
    # an environment for running the front-end prototype with no backend
    app.ignore_routes = true
  end

  configure :staging do
    # put your staging config here
  end

  configure :production do
    # put your production config here
  end

  middleware do |builder|
    builder.use Sass::Plugin::Rack
  end
end
