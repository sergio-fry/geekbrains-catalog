if defined? Sentry
  Sentry.init do |config|
    config.dsn = "https://164437dc846d443e8569a4cd2ca96d56@o225422.ingest.sentry.io/6555829"
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
  end
end
