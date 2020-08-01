require 'exception_notification/rails'

ExceptionNotification.configure do |config|
  config.add_notifier :slack, {
    webhook_url: ENV['WEBHOOK_URL'],
    channel: '旅系sns'
  }
  # config.ignore_if do |exception, options|
  #   !Rails.env.production?
  # end
end
