require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
module ActiveResource #:nodoc:
  module Extend
    module AuthWithApi
      module ClassMethods
        def element_path_with_auth(*args)
          element_path_without_auth(*args).concat("?auth_token=#{self.api_key}")
        end
        def new_element_path_with_auth(*args)
          new_element_path_without_auth(*args).concat("?auth_token=#{self.api_key}")
        end
        def collection_path_with_auth(*args)
          collection_path_without_auth(*args).concat("?auth_token=#{self.api_key}")
        end
      end

      def self.included(base)
        base.class_eval do
          extend ClassMethods
          class << self
            alias_method_chain :element_path, :auth
            alias_method_chain :new_element_path, :auth
            alias_method_chain :collection_path, :auth
            attr_accessor :api_key
          end
        end
      end  
    end
  end  
end
