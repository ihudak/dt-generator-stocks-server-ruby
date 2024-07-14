# config/initializers/opentelemetry.rb
require 'opentelemetry/sdk'
require 'opentelemetry-exporter-otlp-http'
require 'opentelemetry/instrumentation/all'

OpenTelemetry::SDK.configure do |c|
  c.service_name = 'stock-server-ruby'
  c.endpoint = 'http://localhost:14499/otlp/v1/traces'
  c.use_all() # enables all instrumentation!
end

