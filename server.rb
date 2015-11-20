require "sinatra"
require "./analytics_client"
require "json"

get "/downloads.json" do
  headers["Content-Type"] = "application/json"
  headers["Access-Control-Allow-Origin"] = ENV["CORS_DOMAIN"]
  JSON.unparse(AnalyticsClient.get_downloads)
end
