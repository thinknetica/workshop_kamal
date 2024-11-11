Yabeda.configure do
  Yabeda::ActiveJob.install!

  if ENV.fetch("START_METRICS_SERVER", nil)
    Prometheus::Client.config.data_store = Prometheus::Client::DataStores::DirectFileStore.new(dir: "/tmp")

    require "webrick"
    require "rackup/handler/webrick" # Explicitly require the WEBrick handler

    Yabeda::Prometheus::Exporter.start_metrics_server!(rack_handler: :puma)
  end
end
