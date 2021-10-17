require 'sidekiq'

REDIS_URL = ENV['REDIS_URL']

Sidekiq.configure_server do |config|
  config.redis = { url:  REDIS_URL }
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end
