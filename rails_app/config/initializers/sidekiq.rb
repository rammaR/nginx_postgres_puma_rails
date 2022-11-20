require 'sidekiq'

Sidekiq.configure_server do |config|
    #config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://localhost:6379/1') }
    # config.redis = { url:  "redis://#{ENV['REDIS_URL']}:#{ENV['REDIS_PORT']}/12" }
    config.redis = { url: 'redis://redis:6379/12' }
end


Sidekiq.configure_client do |config|
    # config.redis = { url: ENV.fetch('REDIS_URL_SIDEKIQ', 'redis://localhost:6379/1') }
    # config.redis = { url:  "redis://#{ENV['REDIS_URL']}:#{ENV['REDIS_PORT']}/12" }
    config.redis = { url: 'redis://redis:6379/12' }
end