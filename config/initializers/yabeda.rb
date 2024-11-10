Yabeda::ActiveJob.install!
Yabeda::Prometheus::Exporter.start_metrics_server! if ENV.fetch("START_METRICS_SERVER", nil)
