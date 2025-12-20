if Rails.env.production?
  Sentry.init do |config|
    config.dsn = ENV["TELEBUGS_DSN"]

    # get breadcrumbs from logs
    config.breadcrumbs_logger = [ :active_support_logger, :http_logger ]

    config.excluded_exceptions = []
  end
end
