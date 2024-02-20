RailsSettings.configure do
    self.cache_storage = ActiveSupport::Cache::RedisCacheStore.new(url: "redis://localhost:6379")
  end