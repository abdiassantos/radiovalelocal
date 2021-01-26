# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Radiovale
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'America/Sao_Paulo'

    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = %i[pt-BR en]
    config.i18n.default_locale = :'pt-BR'

    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.autoload_paths << Rails.root.join('config', 'routes')
    config.assets.precompile += %w(ckeditor/config.js)

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       routing_specs: false,
                       controller_specs: false
    end

    ## Generators Configuration
    config.generators do |g|
      g.stylesheets = false
      g.javascripts = false
      g.helper      = false
      g.assets      = false
    end
  end
end
