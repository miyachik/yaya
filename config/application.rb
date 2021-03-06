require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module RubyGettingStarted
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('bot')
    config.autoload_paths << Rails.root.join('app','services')

    config.autoload_paths << Rails.root.join('app','jobs')
    config.active_job.queue_adapter = :sidekiq
    config.time_zone = 'Tokyo'

  end
end
