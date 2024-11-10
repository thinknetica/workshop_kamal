Yabeda::ActiveJob.install!

if ENV.fetch("START_METRICS_SERVER", nil)
  require "webrick"
  require "rackup/handler/webrick" # Explicitly require the WEBrick handler

  Yabeda::Prometheus::Exporter.start_metrics_server!(rack_handler: :puma)
end
