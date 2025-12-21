Lapsoss.configure do |config|
  config.use_telebugs(dsn: ENV["TELEBUGS_DSN"])
  config.async = true
  config.environment = Rails.env
end
